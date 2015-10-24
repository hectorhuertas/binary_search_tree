def insert_at(location, new_value)
  if send(location).nil?
    instance_variable_set(:"@#{location}", Node.new(new_value))
  else
    send(location).insert(new_value)
  end
end

def insert(new_value)
  case new_value <=> value
  when 0  then p 'Data already on tree'
  when -1 then insert_at(:lesser_child, new_value)
  when 1  then insert_at(:greater_child, new_value)
  end
end
