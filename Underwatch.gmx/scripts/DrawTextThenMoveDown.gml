///DrawTextThenMoveDown
TextToWrite = argument[0]

draw_text(x,CurrentY,TextToWrite)

CurrentY = CurrentY + string_height(TextToWrite) + Margin
