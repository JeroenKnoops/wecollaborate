module ActiveAdmin
  module Views

    class AttributesTable < ActiveAdmin::Component
      builder_method :attributes_table_for

      def build(obj, *attrs)
        @collection     = obj.respond_to?(:each) && !obj.is_a?(Hash) ? obj : [obj]
        @resource_class = @collection.first.class
        options = { }
        options[:for] = @collection.first if single_record?
        super(options)
        @table = table
        build_colgroups
        rows(*attrs)
      end

      def rows(*attrs)
        attrs.each {|attr| row(attr) }
      end

      def row(*args, &block)
        title   = args[0]
        options = args.extract_options!
        classes = [:row]
        if options[:class]
          classes << options[:class]
        elsif title.present?
          classes << "row-#{title.to_s.parameterize('_')}"
        end
        options[:class] = classes.join(' ')

        @table << tr(options) do
          th do
            header_content_for(title)
          end
          @collection.each do |record|
            td do
              content_for(record, block || title)
            end
          end
        end
      end

      protected

      def default_id_for_prefix
        'attributes_table'
      end

      # Build Colgroups
      #
      # Colgroups are only necessary for a collection of records; not
      # a single record.
      def build_colgroups
        return if single_record?
        reset_cycle(self.class.to_s)
        within @table do
          col # column for row headers
          @collection.each do |record|
            classes = Arbre::HTML::ClassList.new
            classes << cycle(:even, :odd, :name => self.class.to_s)
            classes << dom_class_name_for(record)
            col(:id => dom_id_for(record), :class => classes)
          end
        end
      end

      def header_content_for(attr)
        if @resource_class.respond_to?(:human_attribute_name)
          @resource_class.human_attribute_name(attr, :default => attr.to_s.titleize)
        else
          attr.to_s.titleize
        end
      end

      def empty_value
        span I18n.t('active_admin.empty'), :class => "empty"
      end

      def content_for(record, attr)
        previous = current_arbre_element.to_s
        value    = pretty_format find_attr_value(record, attr)
        value.blank? && previous == current_arbre_element.to_s ? empty_value : value
      end

      def find_attr_value(record, attr)
        if attr.is_a?(Proc)
          attr.call(record)
        elsif attr.to_s[/\A(.+)_id\z/] && record.respond_to?($1)
          record.send($1)
        elsif record.respond_to? attr
          record.send(attr)
        elsif record.respond_to? :[]
          record[attr]
        end
      end

      def single_record?
        @single_record ||= @collection.size == 1
      end
    end

  end
end
