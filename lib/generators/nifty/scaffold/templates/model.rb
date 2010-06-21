class <%= class_name %><%= " < #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include Mongoid::Document
<% end -%>
<% if options[:timestamps] -%>
  include Mongoid::Timestamps
<% end -%>
<% if options[:timestamps] -%>
  include Mongoid::Versioning
<% end -%>
  
<% model_attributes.reject{|attr| attr.reference? }.each do |attribute| -%>
  field :<%= attribute.name %>, :type => <%= attribute.type_class %>
<% end -%>
<% model_attributes.select{|attr| attr.reference? }.each do |attribute| -%>
  embedded_in :<%= attribute.name %>, :inverse_of => :<%= class_name.tableize %>
<% end -%>
end
