while true do
    if turtle.getItemCount() == 0 then
        slot = turtle.getSelectedSlot()
        slot = slot + 1
        turtle.select(slot)
    end
    turtle.digDown()
    turtle.placeDown()
    turtle.forward()
end