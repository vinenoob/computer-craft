for i=55, 1, -1 do
    if turtle.getItemCount() == 0 then
        slot = turtle.getSelectedSlot()
        slot = slot + 1
        turtle.select(slot)
    end
    turtle.place()
    turtle.down()
    turtle.back()
end