-- LaTeX To Do List (Lua companion)
-- Copyright © 2013–2017, Chris Warrick.
-- See /LICENSE (in the distribution) for licensing information.

PLACEHOLDER = "\\textcolor{backgray}{%s}"

function todorow(number, completed, priority, tag, task, month, day, notes)
    if completed == "1" then
        completed_entry = "\\fcb{C}"
    else
        completed_entry = "\\fbox{C}"
    end

    if priority == "1" then
        priority_entry = "\\sps\\fcb{1}\\sps\\fbox{2}\\sps\\fbox{3}\\sps"
    elseif priority == "2" then
        priority_entry = "\\sps\\fbox{1}\\sps\\fcb{2}\\sps\\fbox{3}\\sps"
    elseif priority == "3" then
        priority_entry = "\\sps\\fbox{1}\\sps\\fbox{2}\\sps\\fcb{3}\\sps"
    else
        priority_entry = "\\sps\\fbox{1}\\sps\\fbox{2}\\sps\\fbox{3}\\sps"
    end

    if tag == "" then
        tag = string.format(PLACEHOLDER, "T")
    end

    if month == "" then
        month1 = string.format(PLACEHOLDER, "M")
        month2 = month1
    else
        if string.len(month) == 1 then
            month = "0" .. month
        end
        month1 = string.sub(month, 1, 1)
        month2 = string.sub(month, 2, 2)
    end

    if day == "" then
        day1 = string.format(PLACEHOLDER, "D")
        day2 = day1
    else
        if string.len(day) == 1 then
            day = "0" .. day
        end
        day1 = string.sub(day, 1, 1)
        day2 = string.sub(day, 2, 2)
    end

    tex.print(string.format([[%d&\centering\textcolor{backgray}{\sps%s\sps}&\textcolor{backgray}{%s}&\centering{}%s&%s&\phantom{|}\todoyear\phantom{|}&\centering{}%s&\centering{}%s&\centering{}%s&\centering{}%s&%s\\\hline]],
        number, completed_entry, priority_entry, tag, task, month1, month2, day1, day2, notes))

end


function todonumberformat(number_s, empty)
    if empty == "1" or number_s == "" then
        tex.print([[\color{white}00]])
    else
        number = tonumber(number_s)
        if number < 9 then
            tex.print(string.format([[\color{white}0\color{ngray}%d]], number))
        else
            tex.print(string.format([[\color{ngray}%d]], number))
        end
    end
end
