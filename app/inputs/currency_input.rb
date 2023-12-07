class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    input_html_options[:type] ||= 'text'
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    @builder.text_field(attribute_name, merged_input_options)
  end
end