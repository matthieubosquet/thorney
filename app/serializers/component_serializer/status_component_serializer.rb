module ComponentSerializer
  class StatusComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a status component.
    #
    # @param [String] type a string that represents the type for the status component.
    # @param [Array<Hash>] display_data used for the element's css.
    # @param [String] selector a string to be the id attribute of the status component.
    # @param [Array<Object>] components objects that are to be children of the status component.
    #
    # @example Initialising a status banner component
    #  type_of_status = 'banner'
    #  display_data = [display_data(component: 'status', variant: 'banner')]
    #  css_id = 'cookie'
    #  a_serializer = ComponentSerializer::ParagraphComponentSerializer.new([{ content: 'banner text' }]).to_h
    #   ComponentSerializer::StatusComponentSerializer.new(type: type_of_status, display_data: display_data, selector: css_id, components: [a_serializer]).to_h
    #
    # @example Initialising a status primary component
    #  type_of_status = 'highlight'
    #  display_data = [display_data(component: 'status', variant: 'highlight')]
    #  a_serializer = ComponentSerializer::ParagraphComponentSerializer.new([{ content: 'highlight text' }]).to_h
    #  ComponentSerializer::SectionComponentSerializer.new(type: type_of_status, display_data: display_data, components: [a_serializer]).to_h
    def initialize(type: nil, display_data: nil, selector: nil, components: nil)
      @type = type
      @display_data = display_data
      @selector = selector
      @components = components
    end

    def name
      "status__#{@type}"
    end

    def data
      {}.tap do |hash|
        hash[:link] = @link if @link
        hash[:display] = display_hash(@display_data) if @display_data
        hash[:selector] = @selector if @selector
        hash[:components] = @components if @components
      end
    end
  end
end
