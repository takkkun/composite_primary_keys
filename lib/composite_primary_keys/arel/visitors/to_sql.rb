class Arel::Visitors::ToSql
  alias original_visit_Arel_Nodes_Equality visit_Arel_Nodes_Equality

  def visit_Arel_Nodes_Equality o
    if o.right.is_a?(Array)
      relation = o.left.relation

      o.left.name.zip(o.right).map do |name_and_value|
        name, value = name_and_value
        left = Arel::Attributes::Attribute.new(relation, name)
        "#{visit left} = #{visit value}"
      end
    else
      original_visit_Arel_Nodes_Equality(o)
    end
  end
end
