while true do
    turtle.attack()
    if turtle.getItemCount() > 0 then
        turtle.drop()
    end
end