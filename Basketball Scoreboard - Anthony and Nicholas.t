% By: Anthony Canzona and Nicholas Iafrate
% Mr.Rosen TEJ201 ISP Scoreboard
% January  17, 2018
% This program is the scoreboard and programing aspect to the ISP hardware project. It keeps track of the time and score of the game and interactes with the arduino.

%Screen Setup
setscreen ("noecho")
setscreen ("nocursor")

%Variables used throughout the program
var times : int
var newfont : int := Font.New ("Impact:30")
var fonte : int := Font.New ("Goudy Stout:50")
var fonts : int := Font.New ("Times New Roman:15")
var scores : int := 0
var introf : int := Font.New ("Snap ITC:50")
var cdnf : int := Font.New ("Impact:35")
var ch : string (1)

%Introduction
proc Intro
    %Graphics (Background and Title)
    drawfillbox (maxx, maxy, 0, 0, 76)
    Font.Draw ("BASKETBALL", 65, 270, introf, 41)
    Font.Draw ("Click the START BUTTON to begin", 160, 50, fonts, red)
    %Countdown to Start
    loop
	getch (ch) %Start Button
	case ch (1) of
	    label 'S' :
		cls
		drawfillbox (maxx, maxy, 0, 0, 93)
		drawfilloval (320, 200, 150, 150, red)
		Font.Draw ("3", 290, 190, fonte, white)
		play ("2-f")
		delay (500)
		cls
		drawfillbox (maxx, maxy, 0, 0, 93)
		drawfilloval (320, 200, 150, 150, red)
		Font.Draw ("2", 290, 190, fonte, white)
		play ("2-f")
		delay (500)
		cls
		drawfillbox (maxx, maxy, 0, 0, 93)
		drawfilloval (320, 200, 150, 150, red)
		Font.Draw ("1", 290, 190, fonte, white)
		play ("2-f")
		delay (500)
		cls
		drawfillbox (maxx, maxy, 0, 0, 93)
		drawfilloval (320, 200, 150, 150, 10)
		Font.Draw ("GO", 240, 190, fonte, white)
		play ("1>+a")
		delay (500)
		cls
		exit
	end case
    end loop
end Intro

%Scoreboard
proc SCOREBOARD
    var timelimit : int := Time.Sec + 60
    %Graphics
    drawfillbox (maxx, maxy, 0, 0, black)
    drawfillbox (620, 380, 20, 20, white)
    drawfillbox (600, 360, 40, 40, black)
    Font.Draw ("SCOREBOARD", 200, 300, newfont, white)
    Font.Draw ("TIME: ", 100, 200, newfont, white)
    Font.Draw ("SCORE: ", 72, 100, newfont, white)
    loop
	%Time Display
	times := timelimit - Time.Sec
	drawfillbox (200, 250, 400, 200, black)
	Font.Draw (intstr (times), 272, 200, newfont, white)
	delay (1)
	if times = 0 then
	    exit
	end if
	if hasch then
	    getch (ch) %Limit Switch Input
	    case ch (1) of
		label 'P' :
		    %Score Display
		    scores := scores + 1
		    drawfillbox (200, 150, 400, 100, black)
		    delay (10)
		    Font.Draw (intstr (scores), 272, 100, newfont, white)
	    end case
	end if
    end loop
end SCOREBOARD

%Game Over Screen
proc ends
    drawfillbox (maxx, maxy, 0, 0, black)
    Font.Draw ("GAME OVER ", 220, 300, newfont, red)
    Font.Draw ("Times Up. You got a score of: ", 95, 250, newfont, white)
    Font.Draw (intstr (scores), 300, 150, newfont, white)
    play ("<<<-1g>-1g>-1g")
end ends

%Procedure Displays
Intro
cls
SCOREBOARD
cls
ends


