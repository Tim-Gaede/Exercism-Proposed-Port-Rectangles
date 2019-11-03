function rectangles(text::Array{Any,1})
    cnt = 0
    for top = 1 : length(text)-1
        for left = 1 : length(text[top]) - 1
            if text[top][left] == '+'
                for rght = left+1 : length(text[top])
                    if text[top][rght] == '+'  &&
                       unbrokenHoriEdge(text, top, left, rght)
                        for bot = top+1 : length(text)
                            if text[bot][left] == text[bot][rght] == '+'  &&
                                unbrokenHoriEdge(text, bot, left, rght)   &&
                                unbrokenVertEdge(text, left, top, bot)    &&
                                unbrokenVertEdge(text, rght, top, bot)

                                cnt += 1
                            end
                        end
                    end
                end
            end
        end
    end


    cnt
end

function unbrokenHoriEdge(text, row, left, rght)
    break_fnd = false
    col = left+1
    while !break_fnd  &&  col < rght
        if text[row][col] != '+'  &&   text[row][col] != '-'
            break_fnd = true
        else
            col += 1
        end
    end


    !break_fnd
end


function unbrokenVertEdge(text, col, top, bot)
    break_fnd = false
    row = top+1
    while !break_fnd  &&  row < bot
        if text[row][col] != '+'  &&  text[row][col] != '|'
            break_fnd = true
        else
            row += 1
        end
    end

    !break_fnd
end
