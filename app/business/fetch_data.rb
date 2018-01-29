class FetchData
  attr_accessor :repository, :response

  include HTTParty

  base_uri 'https://app.pipefy.com'

  def self.fetch!
    new.fetch!
  end

  def initialize
    self.response = self.class.post('/queries', headers: headers, body: request_body )
  end

  def fetch!
    create_data(JSON.parse(response.body, symbolize_names: true)[:data])
  end

  private

  def create_data(hash)
    organization = Organization.find_or_create_by(organization_attrs(hash))

    pipes = pipe_attrs(hash)
    phases = phase_attrs(hash)
    pipe_fields = pipe_fields_attrs(hash)
    phase_fields = phase_fields_attrs(hash)

    pipes.each do |pipe_attr|
      organization.pipes.find_or_create_by(pipe_attr)

      organization.pipes.each do |pipe|
        pipe_fields.each do |field_attr|
          pipe.fields.find_or_create_by(field_attr)
        end

        phases.each do |phase_attr|
          pipe.phases.find_or_create_by(phase_attr.except(:cards)).tap do |phase|

            phase_fields.each do |field_attr|
              next if phase.api_id != field_attr[:phase][:id]

              phase.fields.find_or_create_by(field_attr.except(:phase))
            end

            phase_attr[:cards][:edges].each do |edge|
              card_attr = assign_api_id(edge[:node])

              card_attrs = card_field_attrs(card_attr)

              phase.cards.find_or_create_by(card_attrs.except(:fields, :fields_attributes)).tap do |card|
                card_attrs[:fields_attributes].each do |field_attribute|
                  card.card_fields.find_or_create_by(field_attribute)
                end
              end
            end
          end
        end
      end
    end
    hash
  end

  def organization_attrs(hash)
    attrs = hash[:organization].except(:pipes)
    attrs[:api_id] = attrs.delete(:id)
    attrs
  end

  def pipe_attrs(hash)
    attrs = hash[:organization][:pipes].map { |p| p.except(:phases, :start_form_fields) }
    delete_id(attrs)
  end

  def phase_attrs(hash)
    attrs = hash[:organization][:pipes].map{ |p| p[:phases] }.flatten.map { |p| p.except(:fields) }
    delete_id(attrs)
  end

  def pipe_fields_attrs(hash)
    attrs = hash[:organization][:pipes].map { |p| p[:start_form_fields] }.flatten
    delete_id(attrs)
  end

  def phase_fields_attrs(hash)
    attrs = hash[:organization][:pipes].map{ |p| p[:phases] }.flatten.map { |p| p[:fields] }.flatten
    delete_id(attrs)
  end

  def card_field_attrs(hash)
    hash[:fields_attributes] = []

    hash[:fields].each do |h|
      field = Field.find_by(api_id: h[:field][:id])

      hash[:fields_attributes] << { name: h[:name], value: h[:value], field_id: field.id }
    end

    hash
  end

  def delete_id(hash)
    hash.map { |h| assign_api_id(h) }
    hash
  end

  def assign_api_id(hash)
    return hash if hash.has_key?(:api_id)

    hash[:api_id] = hash.delete(:id)
    hash
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['PIPEFY_TOKEN']}"
    }
  end

  def request_body
    '{ "query": "{ organization(id: 92858){ id name pipes(ids: [335557]) { id name start_form_fields { id label } phases { id name fields { id label phase { id } } cards { edges { node { id title fields { name value field { id } } } } } } } } }" }'
  end
end
