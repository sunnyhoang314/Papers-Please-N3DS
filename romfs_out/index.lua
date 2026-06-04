Graphics.init()
oldpad = Controls.read()
STICK = {x = 0,y = 0}
CAGE = {y = {},OLDy=-17,min = 103,yshadow = -37}
RED = Color.new(255,80,80)
YELLOW = Color.new(255,255,80)
GREEN = Color.new(80,255,80)
WHITE = Color.new(255,255,255)
BLUE = Color.new(80,80,255)
BROWN = Color.new(87,72,72)
BLACK = Color.new(0,0,0)
MENU_RED = Color.new(255,0,0)
DOCUMENTS_WHITE = Color.new(237,224,216)
ENTRYTICKET_BROWN = Color.new(119,103,137)
IDCARD_BCOLOR=Color.new(61,57,77)
IDCARD_WCOLOR=Color.new(217,189,247)
WORKPASS_COLOR=Color.new(138,105,107)
BKG_BROWN = Color.new(25,18,18)
SHADOW = Color.new(0,0,0,150)
GRAY=Color.new(50,50,50)
BROWN2=Color.new(66,42,28)
BROWN3=Color.new(106,82,47)
TRANSCRIPTBROWN = Color.new(87,72,72)
TRANSCRIPTBLUE = Color.new(210,237,236)
Th,Tm,Ts = System.getTime() -- Get System Time
today={} 
today.day_value,today.day,today.month,today.year = System.getDate() -- Get System Date
math.randomseed(Th*3600+Tm*60+Ts)
if System.currentDirectory() == "/" then
	System.currentDirectory("romfs:/")
end
TITLEi=0
DEMO_BUTTON_STATE = false
Sound.init()
THEME_SONG = Sound.openWav("romfs:/ASSETS/AUDIO/test2.wav", true)
BUTTON_UP_SOUND = Sound.openWav("romfs:/ASSETS/AUDIO/19. Button Up.wav", 0)
BUTTON_DOWN_SOUND = Sound.openWav("romfs:/ASSETS/AUDIO/17. Button Down.wav", 0)
if THEME_SONG then
    Sound.play(THEME_SONG, true)
end

NORMAL_FONT = Graphics.loadImage(System.currentDirectory().."ASSETS/FONT/NORMAL_FONT.png")
SMALL_FONT = Graphics.loadImage(System.currentDirectory().."ASSETS/FONT/SMALL_FONT.png")
DIGITS = Graphics.loadImage(System.currentDirectory().."ASSETS/FONT/DIGITS.png")
dofile(System.currentDirectory().."FontInfo.lua")
dofile(System.currentDirectory().."DataFile.lua")
DEMObutton = Graphics.loadImage(System.currentDirectory().."ASSETS/DEMObutton.png")
EXITbutton = Graphics.loadImage(System.currentDirectory().."ASSETS/EXITbutton.png")
Title = Graphics.loadImage(System.currentDirectory().."ASSETS/Title.png")
textTextures={}
function loadtex()
	BKG_BTMS = Graphics.loadImage(System.currentDirectory().."ASSETS/BKG_BTMS.png")
	BKG_TPS = Graphics.loadImage(System.currentDirectory().."ASSETS/BKG_TPS.png")
	STMP_SPRITE = Graphics.loadImage(System.currentDirectory().."ASSETS/STMP_SPRITE.png")
	BKG_MONITORS = Graphics.loadImage(System.currentDirectory().."ASSETS/BKG_MONITORS.png")
	CAGE_TXR = Graphics.loadImage(System.currentDirectory().."ASSETS/CAGE.png")
	WALL_TXR = Graphics.loadImage(System.currentDirectory().."ASSETS/WALL.png")
	SHADOW_TXR = Graphics.loadImage(System.currentDirectory().."ASSETS/SHADOW.png")
	PASSPORT_SHEET = Graphics.loadImage(System.currentDirectory().."ASSETS/PASSPORTSHEET.png")
	NOTPASSPORT_SHEET = Graphics.loadImage(System.currentDirectory().."ASSETS/NOTPASSPORTSHEET.png")
	YESSTAMP=Graphics.loadImage(System.currentDirectory().."ASSETS/YESSTAMP.png")
	NOSTAMP=Graphics.loadImage(System.currentDirectory().."ASSETS/NOSTAMP.png")
	RULEBOOKSHEETS=Graphics.loadImage(System.currentDirectory().."ASSETS/RULEBOOKSHEETS.png")
	ENTRYTICKET.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/ENTRYTICKET_TEX.png")
	ENTRYTICKET.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/ENTRYTICKET_TEX2.png")
	ENTRYPERMIT.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/ENTRYPERMIT_TEX.png")
	ENTRYPERMIT.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/ENTRYPERMIT_TEX2.png")
	CARIMAGE = Graphics.loadImage(System.currentDirectory().."ASSETS/CARIMAGE.png")
	IDCARD.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/IDCARD_TEX.png")
	IDCARD.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/IDCARD_TEX2.png")
	PASSPORT.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/PASSPORT_TEX.png")
	PASSPORT.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/PASSPORT_TEX2.png")
	WORKPASS.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/WORKPASS_TEX.png")
	WORKPASS.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/WORKPASS_TEX2.png")
	RULEBOOK.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/RULEBOOK_TEX.png")
	RULEBOOK.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/RULEBOOK_TEX2.png")
	TRANSCRIPT.tex = Graphics.loadImage(System.currentDirectory().."ASSETS/TRANSCRIPT_TEX.png")
	TRANSCRIPT.tex2 = Graphics.loadImage(System.currentDirectory().."ASSETS/TRANSCRIPT_TEX2.png")
	TRANSCRIPT.tex3 = Graphics.loadImage(System.currentDirectory().."ASSETS/TRANSCRIPT_LINE.png")
	GIVE = Graphics.loadImage(System.currentDirectory().."ASSETS/GIVE.png")
	SB = Graphics.loadImage(System.currentDirectory().."ASSETS/SB.png")
	clockHOUR = Graphics.loadImage(System.currentDirectory().."ASSETS/clockHOUR.png")
	clockMINUTE = Graphics.loadImage(System.currentDirectory().."ASSETS/clockMINUTE.png")
	CHSheet = Graphics.loadImage(System.currentDirectory().."ASSETS/CHSheet.png")
	FACE = {x=-24,y=104,Graphics.loadImage(System.currentDirectory().."ASSETS/FACE_1.png"), Graphics.loadImage(System.currentDirectory().."ASSETS/FACE_2.png"), Graphics.loadImage(System.currentDirectory().."ASSETS/FACE_3.png"), Graphics.loadImage(System.currentDirectory().."ASSETS/FACE_4.png"), Graphics.loadImage(System.currentDirectory().."ASSETS/FACE_5.png")}
end
function GarbageCollection()
	if BKG_BTMS~= nil then
		Graphics.freeImage(BKG_BTMS)
		Graphics.freeImage(BKG_TPS)
		Graphics.freeImage(STMP_SPRITE)
		Graphics.freeImage(BKG_MONITORS)
		Graphics.freeImage(CAGE_TXR)
		Graphics.freeImage(WALL_TXR)
		Graphics.freeImage(SHADOW_TXR)
		Graphics.freeImage(PASSPORT_SHEET)
		Graphics.freeImage(NOTPASSPORT_SHEET)
		Graphics.freeImage(YESSTAMP)
		Graphics.freeImage(NOSTAMP)
		Graphics.freeImage(RULEBOOKSHEETS)
		Graphics.freeImage(ENTRYTICKET.tex)
		Graphics.freeImage(ENTRYTICKET.tex2)
		Graphics.freeImage(ENTRYPERMIT.tex)
		Graphics.freeImage(ENTRYPERMIT.tex2)
		Graphics.freeImage(CARIMAGE)
		Graphics.freeImage(IDCARD.tex)
		Graphics.freeImage(IDCARD.tex2)
		Graphics.freeImage(PASSPORT.tex)
		Graphics.freeImage(PASSPORT.tex2)
		Graphics.freeImage(RULEBOOK.tex)
		Graphics.freeImage(RULEBOOK.tex2)
		Graphics.freeImage(WORKPASS.tex)
		Graphics.freeImage(WORKPASS.tex2)
		Graphics.freeImage(TRANSCRIPT.tex)
		Graphics.freeImage(TRANSCRIPT.tex2)
		Graphics.freeImage(TRANSCRIPT.tex3)
		Graphics.freeImage(clockHOUR)
		Graphics.freeImage(clockMINUTE)
		Graphics.freeImage(FACE[1])
		Graphics.freeImage(FACE[2])
		Graphics.freeImage(FACE[3])
		Graphics.freeImage(FACE[4])
		Graphics.freeImage(GIVE)
		Graphics.freeImage(SB)
		Graphics.freeImage(CHSheet)
	end
	Graphics.freeImage(NORMAL_FONT)
	Graphics.freeImage(SMALL_FONT)
	Graphics.freeImage(DIGITS)
	Graphics.freeImage(DEMObutton)
	Graphics.freeImage(EXITbutton)
	Graphics.freeImage(Title)
end
function LOAD_ITEMS()
	PASSPORT={key="PASSPORT"} --Load Data for PASSPORT
	ENTRYTICKET={key="ENTRYTICKET"} --Load Data for ENTRYTICKET
	ENTRYPERMIT={key="ENTRYPERMIT"}	--Load Data for ENTRYPERMIT
	IDCARD={key="IDCARD"} --Load Data for IDCARD
	WORKPASS={key="WORKPASS"} --Load Data for WORKPASS
	TRANSCRIPT={key="TRANSCRIPT",now=1,x=16,y=-27} --Load Data for TRANSCRIPT
	RULEBOOK={state=2,key="RULEBOOK",now=1,x=5,y=23} --Load Data for RULEBOOK
	DESKTOP={"RULEBOOK","TRANSCRIPT"} --NAMES OF THE ITEMS THAT ON TABLE
	ALLITEMS={RULEBOOK,TRANSCRIPT} --TABLES OF ITEMS THAT IN DESKTOP table
end
LOAD_ITEMS()
BKG_TPSX = 0 --X coordinate of UPPER map
SWITCHER = 1 --Shutter will be closed from the beginning
PERSON={face=math.random(1,44),realface=math.random(1,44)}
STAMP={x=310,y=42,state="CLOSED",red=22,green=22,velocity=0}
CAR={} --Table for Car
LASTWRONGCONST="..."
WRONGCONST = "Nothing"
CHAT={} --Storage for dialog bubbles
CHATplace={} --1 - left; 2 - right
CHATx={} -- x coordinate for every dialog bubble
ENTRYTICKET.rot = math.random(-4,4)/10
ENTRYPERMIT.rot =  math.random(-4,4)/10
IDCARD.rot =  math.random(-4,4)/10
PASSPORT.rot =  math.random(-4,4)/10
WORKPASS.rot =  math.random(-4,4)/10
notconst = 0
SCORE = 0
PEOPLESCORE = 0
CheckPoint = 1
stamp="YES" 
Options={
	Shadow = 1, -- 0 - to Off Shadow; 1 - to On Shadow
	TextAlign = 0, -- 0 - no align function (increases FPS(for Old3DS)); 1 - Turn on centered text
	NiceShutter = 1, -- 0 - to Off Shutter Animation; 1 - to On Shutter Animation
	Car = 1, -- 0 to Delete Car from Screen; 1 to Add it
	Dialog = 0,
	State = 0
}
model = System.getModel()
if model==2 or model>3 then
	Options.Shadow = 1
	Options.TextAlign=1
	Options.NiceShutter=1
	Options.Car=1
	Options.Dialog = 1
end
function BKG_SHDW() -- Adds shadow behind CAGE
	if SWITCHER == 1 and CAGE.yshadow < 103 then
		CAGE.yshadow = CAGE.yshadow + 8
	end
	if SWITCHER == 0 and CAGE.yshadow > -37 then
		CAGE.yshadow = CAGE.yshadow - 4
	end
	if CAGE.yshadow < -37 then
		CAGE.yshadow = -37
	end
	if CAGE.yshadow > 103 then
		CAGE.yshadow = 103
	end
	Graphics.drawImage(112,CAGE.yshadow,SHADOW_TXR)
end
pi=math.pi
timer = Timer.new()
Clock = Timer.new()
clockInt = 0
CBtime= Timer.new()
activatescreenshot=0
menu=0
TITLEy=240
DEMO={}
EXIT={}
function OptionsOP()
	if Controls.check(pad,KEY_DUP) and Controls.check(pad,KEY_A) and Controls.check(pad,KEY_B) and not Controls.check(oldpad,KEY_DUP) then
		if Options.State==1 then Options.State=0 elseif Options.State==0 then Options.State=1 end 
	end
	if Options.State==1 then
		Options.Shadow = 1
		Options.TextAlign=1
		Options.NiceShutter=1
		Options.Car=1
		Options.Dialog = 1
		elseif Options.State==0 then
		Options.Shadow = 1
		Options.TextAlign=0
		Options.NiceShutter=1
		Options.Car=1
		Options.Dialog = 0
	end
end
function ScreenButton(xbut,ybut,texture,key,word)
	word.TOUCHED=word.TOUCHED or "NO"
	word.TOUCHED_PREV=word.TOUCHED_PREV or "NO"
	if TOUCHx==0 and TOUCHy==0 and word.TOUCHED == "YES" and TOUCHer~="BB" then                                                                                                                        
		if key==2 then
		end
		if key==2 then
			if BKG_BTMS==nil then
				loadtex()
			end
		end
		menu=key
		word.TOUCHED="NO"
	end
	if TOUCHx>0 and TOUCHy>0 then
		if TOUCHx>=xbut and TOUCHy>=ybut and TOUCHx<=xbut+Graphics.getImageWidth(texture) and TOUCHy<=ybut+(Graphics.getImageHeight(texture)/2) then
			word.TOUCHED="YES"
			else
			word.TOUCHED="NO"
		end
	end
	-- Play sounds on button state transitions for DEMObutton
	if key==2 then
		if word.TOUCHED_PREV=="NO" and word.TOUCHED=="YES" then
			Sound.play(BUTTON_DOWN_SOUND, 0)
			Sound.pause(BUTTON_DOWN_SOUND)
		elseif word.TOUCHED_PREV=="YES" and word.TOUCHED=="NO" then
			Sound.play(BUTTON_UP_SOUND, 0)
			Sound.pause(BUTTON_UP_SOUND)
		end
	end
	word.TOUCHED_PREV=word.TOUCHED
	if word.TOUCHED=="NO" then
		Graphics.drawPartialImage(xbut, ybut, 0, 0, Graphics.getImageWidth(texture), (Graphics.getImageHeight(texture)/2), texture)
		elseif word.TOUCHED=="YES" then
		Graphics.drawPartialImage(xbut, ybut, 0, (Graphics.getImageHeight(texture)/2), Graphics.getImageWidth(texture), (Graphics.getImageHeight(texture)/2), texture)
	end
	
end
function screenshotmake()
	if activatescreenshot>0 then
		activatescreenshot=activatescreenshot-5
		Graphics.fillRect(0,400,0,320,Color.new(255,255,255,activatescreenshot))
	end
end
function CARs()
	CAR.randomo = CAR.randomo or math.random(300,900)
	CAR.y=CAR.y or -(CAR.randomo)
	if CAR.y<CAR.randomo then
		CAR.y=CAR.y+5
		else
		CAR.y = -(CAR.randomo)
		CAR.randomo = nil
	end
	
end
function makeString(l)
	if l < 1 then return nil end -- Check for l < 1
	local s = "" -- Start string
	for i = 1, l do
		s = s .. string.char(math.random(65, 90)) -- Generate random number from 32 to 126, turn it into character and add to string
	end
	return string.upper(s) -- Return string
end
function System.wait(milliseconds)
	tmp = Timer.new()
	while Timer.getTime(tmp) < milliseconds do end
	Timer.destroy(tmp)
end
function MAP_MOVE() -- Moving of map background (BKG_TPS)
	if math.abs(STICK.x) > 15 and BKG_TPSX > -170 and BKG_TPSX < 0 then
		BKG_TPSX = BKG_TPSX - STICK.x/25
	end
	if BKG_TPSX >= 0 then
		BKG_TPSX = -1
		elseif BKG_TPSX <= -170 then
		BKG_TPSX = -169
	end
end
function CAGE_MOVE() -- Adds an Shutter
	if Options.NiceShutter==1 then
		for i=1,6 do
			CAGE.y[i] = CAGE.y[i] or CAGE.min+20*(i-1)
			if CAGE.min<103 and SWITCHER==1 then 
				CAGE.min=CAGE.min+10
			end
			if CAGE.min>33 and SWITCHER==0 then 
				CAGE.min=CAGE.min-10
			end
			if CAGE.y[i]>CAGE.min+20*(i-1) and SWITCHER==1 then
				CAGE.y[i] = CAGE.min+20*(i-1)
			end
			if CAGE.y[i]<CAGE.min+10*(i-1) and SWITCHER==0 then
				CAGE.y[i] = CAGE.min+8*(i-1)
			end
			if SWITCHER==1 and CAGE.y[i]<CAGE.min+20*(i-1) then
				CAGE.y[i] = CAGE.y[i]+8
			end		
			if CAGE.y[6]~=nil then
				if SWITCHER==0 then
					if i>0 and i<6 then
						if CAGE.y[i+1]-10<CAGE.y[i] and CAGE.y[i]>CAGE.min+10*(i-1) then
							CAGE.y[i]=CAGE.y[i]-4
						end
						elseif i==6 then
						if CAGE.y[i]>CAGE.min+10*(i-1) then
							CAGE.y[i]=CAGE.y[i]-4
						end
					end
				end
				Graphics.drawPartialImage(112,CAGE.y[7-i],0,20*(6-i),180,20,CAGE_TXR)
			end
		end
		elseif Options.NiceShutter==0 then
		Graphics.drawImage(112,CAGE.OLDy,CAGE_TXR)
		if CAGE.OLDy<93 and SWITCHER==1 then
			CAGE.OLDy = CAGE.OLDy + 10
			elseif CAGE.OLDy>93 and SWITCHER==1 then
			CAGE.OLDy=CAGE.OLDy-1
		end
		if CAGE.OLDy>-17 and SWITCHER==0 then
			CAGE.OLDy=CAGE.OLDy-4
			elseif CAGE.OLDy<-17 and SWITCHER==0 then
			CAGE.OLDy=CAGE.OLDy+1
		end
	end
	if SWITCHER==1 then
		Graphics.drawPartialImage(262,120,252,123,28,23,STMP_SPRITE)
	end
	if SWITCHER==0 then
		Graphics.drawPartialImage(262,120,252,146,28,23,STMP_SPRITE)
	end
	if Controls.check(pad,KEY_R) and not Controls.check(oldpad,KEY_R) then
		if SWITCHER==1 then SWITCHER=0 elseif SWITCHER==0 then SWITCHER=1 end 
	end
end
function LOAD_FACE(num)
	if CAGE.yshadow~=103 then
		if num <= 24 then
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-0.1)/6)-1)+1)),120*(math.ceil((num-0.1)/6)-1)+1,150,119, FACE[1])
			else
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-24.1)/6)-1)+25)),120*(math.ceil((num-0.1)/6)-5)+1,150,119, FACE[2])
		end
	end
	if CAGE.yshadow<83 then
		if num <= 24 then
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-0.1)/6)-1)+1)),120*(math.ceil((num-0.1)/6)-1)+1,150,CAGE.yshadow+36, FACE[3],Color.new(50,37,37))
			else
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-24.1)/6)-1)+25)),120*(math.ceil((num-0.1)/6)-5)+1,150,CAGE.yshadow+36, FACE[4],Color.new(50,37,37))
		end
		else
		if num <= 24 then
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-0.1)/6)-1)+1)),120*(math.ceil((num-0.1)/6)-1)+1,150,119, FACE[3],Color.new(50,37,37))
			else
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-24.1)/6)-1)+25)),120*(math.ceil((num-0.1)/6)-5)+1,150,119, FACE[4],Color.new(50,37,37))
		end
	end
	if FACE.x~=126 and CAGE.yshadow~=103 then
		if num <= 24 then
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-0.1)/6)-1)+1)),120*(math.ceil((num-0.1)/6)-1)+1,150,119, FACE[3],Color.new(25,18,18))
			else
			Graphics.drawPartialImage(FACE.x,FACE.y,150*(num - (6*(math.ceil((num-24.1)/6)-1)+25)),120*(math.ceil((num-0.1)/6)-5)+1,150,119, FACE[4],Color.new(25,18,18))
		end
	end
	notconst=notconst+0.02
	if notconst>2*pi then
		notconst=notconst-2*pi
	end
	FACE.y=104+2*math.floor(2*math.sin(notconst))
end
function TOUCH_CHECK(word,key)
	if key=="RULEBOOK" then
		word.x = word.x or 5
		word.y = word.y or 23
		elseif key=="TRANSCRIPT" then
		word.x = word.x or 16
		word.y = word.y or -27
		else
		word.x = word.x or 145
		word.y = word.y or -200
	end
	word.now = word.now or 1
	word.velocity=word.velocity or 0
	word.gravity=gravity or 0
	if TOUCHx>0 and TOUCHy>0 then
		if word.now==1 then
			if	TOUCH=="ACTIVE" and TOUCHx >= word.x and TOUCHx <= word.x+Graphics.getImageWidth(word.tex2) and TOUCHy>=word.y and TOUCHy <= word.y+Graphics.getImageHeight(word.tex2) then 
				TOUCH = key
				word.velocity=0
			end
			if TOUCH == key then
				word.oldtouchx = word.oldtouchx or TOUCHx-word.x
				word.oldtouchy = word.oldtouchy or TOUCHy-word.y
				if TOUCHx-word.oldtouchx>35 and TOUCHx-word.oldtouchx+Graphics.getImageWidth(word.tex2)<285 and key~="RULEBOOK" and key~="TRANSCRIPT" then
					word.x=TOUCHx-word.oldtouchx
					elseif TOUCHx-word.oldtouchx<35 and key~="RULEBOOK" and key~="TRANSCRIPT" then
					word.x=35
					elseif word.y<22 and key=="TRANSCRIPT" then
					word.x=16
					elseif TOUCHx-word.oldtouchx>285-math.floor(Graphics.getImageWidth(word.tex2)) then
					word.x=285-math.floor(Graphics.getImageWidth(word.tex2))
					elseif TOUCHx-word.oldtouchx>5 and TOUCHx-word.oldtouchx+Graphics.getImageWidth(word.tex2)<285 and (key=="RULEBOOK" or key=="TRANSCRIPT") then
					word.x=TOUCHx-word.oldtouchx
					elseif TOUCHx-word.oldtouchx<5 and (key=="RULEBOOK" or key=="TRANSCRIPT") then
					word.x=5
				end
				if TOUCHy-word.oldtouchy+Graphics.getImageHeight(word.tex2)<340 and TOUCHy-word.oldtouchy>22 and (stamp==nil or key=="RULEBOOK" or key=="TRANSCRIPT") then
					word.y=TOUCHy-word.oldtouchy
					elseif TOUCHy-word.oldtouchy+Graphics.getImageHeight(word.tex2)<340 and stamp~=nil and key~="RULEBOOK" and key~="TRANSCRIPT" then
					word.y=TOUCHy-word.oldtouchy
					elseif TOUCHy-word.oldtouchy+Graphics.getImageHeight(word.tex2)<340 and key=="TRANSCRIPT" and word.x<36 then
					word.y=TOUCHy-word.oldtouchy
				end
			end
			elseif word.now==0 then
			if	TOUCHy>67 and TOUCH=="ACTIVE" and TOUCHx >= word.x and TOUCHx <= word.x+Graphics.getImageWidth(word.tex) and TOUCHy>=word.y and TOUCHy <= word.y+Graphics.getImageHeight(word.tex) then 
				TOUCH = key
				word.velocity=0
			end
			if TOUCH == key then
				word.oldtouchx = word.oldtouchx or TOUCHx-word.x
				word.oldtouchy = word.oldtouchy or TOUCHy-word.y
				if TOUCHx-word.oldtouchx>-math.floor(Graphics.getImageWidth(word.tex)/2) and TOUCHx-word.oldtouchx+Graphics.getImageWidth(word.tex)<385 then
					word.x=TOUCHx-word.oldtouchx
				end
				if TOUCHy-word.oldtouchy+Graphics.getImageHeight(word.tex)<340 and TOUCHy-word.oldtouchy>-Graphics.getImageHeight(word.tex) then
					word.y=TOUCHy-word.oldtouchy
				end
				if TOUCHx>=word.x+218 and TOUCHx<=word.x+238 and TOUCHy>=word.y+144 and TOUCHy<word.y+158 and key=="RULEBOOK" and RULEBOOK.state<8 then
					RULEBOOK.state=RULEBOOK.state+1
					TOUCH="SHEET"
					elseif TOUCHx>=word.x and TOUCHx<=word.x+16 and TOUCHy>=word.y+144 and TOUCHy<word.y+158 and key=="RULEBOOK" and RULEBOOK.state>2 then
					RULEBOOK.state=RULEBOOK.state-1
					TOUCH="SHEET"
				end
			end
		end
		
		if TOUCHy>67 and TOUCH==key and word.now==1 then
			word.now=0
			word.x=TOUCHx-math.floor(Graphics.getImageWidth(word.tex)/2)
			word.y=TOUCHy-math.floor(Graphics.getImageHeight(word.tex)/2)
			word.oldtouchx = nil
			word.oldtouchy = nil
		end
		if TOUCHy<=67 and TOUCH==key and word.now==0 then
			word.now=1
			word.x=TOUCHx-math.floor(Graphics.getImageWidth(word.tex2)/2)
			word.y=TOUCHy-math.floor(Graphics.getImageHeight(word.tex2)/2)
			word.oldtouchx = nil
			word.oldtouchy = nil
		end
	end	
	if TOUCH~=key and word.now==1 and key~="RULEBOOK" and key~="TRANSCRIPT" then
		if word.y <= 23 then
			word.gravity = 0
			word.velocity = 0
			else 
			word.gravity = 0.1 
		end
		time = Timer.getTime(timer)
		if time>=10 and word.y>24 then
			Timer.reset(timer)
			Timer.resume(timer)
			word.velocity = word.velocity + word.gravity
			word.y=word.y - word.velocity
			elseif word.y<23 then
			word.y=word.y+3
		end
	end
	if TOUCH~=key and word.now==1 and key=="RULEBOOK" then
		if word.x <= 5 then
			word.gravity = 0
			else 
			word.gravity = 0.5 
		end
		time = Timer.getTime(timer)
		if time>=10 then
			Timer.reset(timer)
			Timer.resume(timer)
			word.velocity = word.velocity + word.gravity
			word.x=word.x - word.velocity
		end
		if word.x<5 then word.x=5 end
		if word.y>23 then word.y=word.y-1 end
	end
	if TOUCH~=key and word.oldtouchx~=nil and word.oldtouchy~=nil then
		word.oldtouchx=nil
		word.oldtouchy=nil
	end
	if TOUCH~=key and word.now==1 and key=="TRANSCRIPT" then
		if word.x <= 16 then
			word.gravity = 0
			else 
			word.gravity = 0.5 
		end
		time = Timer.getTime(timer)
		if time>=10 then
			Timer.reset(timer)
			Timer.resume(timer)
			word.velocity = word.velocity + word.gravity
			word.x=word.x - word.velocity
		end
		if word.x<16 then word.x=16 end
		if word.x==16 and word.y>-27 then
			word.y=word.y-3
		end
		if word.x==16 and word.y<-27 then
			word.y=-27
		end
	end
end
function LOAD_IMAGE(word,key)
	if key=="PASSPORT" then 
		if word.now==1 then
			if Options.Shadow==1 then
				Graphics.drawRotateImage(word.x+16, word.y+23, PASSPORT.tex2,PASSPORT.rot,SHADOW)
			end
			Graphics.drawImageExtended(word.x+15, word.y+20, 30*(PERSON.passport - (4*(math.ceil((PERSON.passport-0.1)/4)-1)+1)), 40*(math.ceil((PERSON.passport-0.1)/4)-1), 30, 40, PASSPORT.rot, 1, 1, NOTPASSPORT_SHEET)
			if word.y<22 and TOUCH==key and stamp~=nil and SWITCHER==0 and key~="TRANSCRIPT" then
				Graphics.drawImage(word.x-13, word.y+14, GIVE)
			end
			elseif word.now==0 then
			if TOUCH == key then
				if Options.Shadow==1 then
					Graphics.drawImage(word.x+5, word.y+5, PASSPORT.tex,SHADOW)
				end
			end
			Graphics.drawPartialImage(word.x,word.y,130*(PERSON.passport - (4*(math.ceil((PERSON.passport-0.1)/4)-1)+1)),162*(math.ceil((PERSON.passport-0.1)/4)-1),130,162, PASSPORT_SHEET)
			LOAD_TEXT(key,PERSON.face)
			
		end
		elseif key=="RULEBOOK" then
		if word.now==1 then
			if Options.Shadow==1 then
				Graphics.drawImage(word.x+1, word.y+3, word.tex2,SHADOW)
			end
			Graphics.drawImage(word.x, word.y, word.tex2)
			elseif word.now==0 then
			if TOUCH == key then
				if Options.Shadow==1 then
					Graphics.drawPartialImage(word.x+5,word.y+5,238*(RULEBOOK.state - (2*(math.ceil((RULEBOOK.state-0.1)/2)-1)+1)),158*(math.ceil((RULEBOOK.state-0.1)/2)-1),238,158, RULEBOOKSHEETS,SHADOW)
				end
			end
			Graphics.drawPartialImage(word.x,word.y,238*(RULEBOOK.state - (2*(math.ceil((RULEBOOK.state-0.1)/2)-1)+1)),158*(math.ceil((RULEBOOK.state-0.1)/2)-1),238,158, RULEBOOKSHEETS)
		end
		elseif key=="TRANSCRIPT" then
		if word.now==1 then
			if Options.Shadow==1 then
				Graphics.drawImage(word.x+1, word.y+3, word.tex2,SHADOW)
			end
			Graphics.drawImage(word.x, word.y, word.tex2)
			elseif word.now==0 then
			Graphics.drawImage(word.x, word.y, word.tex)
			LOAD_TEXT(key)
		end
		else
		if word.now==0 then
			if TOUCH == key then
				if Options.Shadow==1 then
					Graphics.drawImage(word.x+5, word.y+5, word.tex,SHADOW)
				end
			end
			Graphics.drawImage(word.x, word.y, word.tex)
			LOAD_TEXT(key)
			
			elseif word.now==1 then
			if Options.Shadow==1 then
				Graphics.drawRotateImage(word.x+1+math.floor(Graphics.getImageWidth(word.tex2)/2), word.y+3+math.floor(Graphics.getImageHeight(word.tex2)/2), word.tex2, word.rot, SHADOW)
			end
			Graphics.drawRotateImage(word.x+math.floor(Graphics.getImageWidth(word.tex2)/2), word.y+math.floor(Graphics.getImageHeight(word.tex2)/2), word.tex2,word.rot)
			if word.y<22 and TOUCH==key and stamp~=nil and key~="TRANSCRIPT" and SWITCHER==0 then
				Graphics.drawImage(word.x+math.floor(Graphics.getImageWidth(word.tex2)/2)-28, word.y+math.floor(Graphics.getImageHeight(word.tex2)/2)-6, GIVE)
			end
			
		end
	end
	if key~="TRANSCRIPT" then
		if word.y<22 and stamp~=nil and SWITCHER==0 and word.now==1 and TOUCH~=key then
			table.remove(DESKTOP,1) 
		end
	end
end
function LOAD_TEXT(key,face)
	if key=="PASSPORT" then
		if PERSON.passport==1 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+138, PERSON.name, BROWN,"l",320,SMALL_FONT,7) -- firstname and lastname
			GPU_DrawText(PASSPORT.x+22,PASSPORT.y+101, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7) -- date of birth
			GPU_DrawText(PASSPORT.x+22,PASSPORT.y+110, PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7) -- gender
			GPU_DrawText(PASSPORT.x+22,PASSPORT.y+119, PERSON.COL, BROWN,"l",320,SMALL_FONT,7) --  city of living
			GPU_DrawText(PASSPORT.x+22,PASSPORT.y+128, PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7) -- PERSON.passEXP
			GPU_DrawText(PASSPORT.x+55,PASSPORT.y+148, PERSON.ID, BROWN,"l",320,SMALL_FONT,7) --id code XXXXX-XXXXX
			Graphics.drawPartialImage(PASSPORT.x+83,PASSPORT.y+88,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==2 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+86, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+98, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+106,  PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+114,  PERSON.COL, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+122,  PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+148,  PERSON.ID, BROWN,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+8,PASSPORT.y+98,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==3 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+85, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+69,PASSPORT.y+96, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+69,PASSPORT.y+104,  PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+69,PASSPORT.y+112,  PERSON.COL, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+69,PASSPORT.y+120,  PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+60,PASSPORT.y+144,  PERSON.ID, BROWN,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+9,PASSPORT.y+96,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==4 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+97, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+107, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+115,  PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+123,  PERSON.COL, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+131,  PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+55,PASSPORT.y+148,  PERSON.ID, BROWN,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+8,PASSPORT.y+107,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==5 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+86, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+26,PASSPORT.y+98, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+26,PASSPORT.y+106,  PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+26,PASSPORT.y+114,  PERSON.COL, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+26,PASSPORT.y+122,  PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+55,PASSPORT.y+148,  PERSON.ID, BROWN,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+85,PASSPORT.y+96,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==6 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+97, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+107, PERSON.DOB, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+115,  PERSON.GNDR, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+123,  PERSON.COL, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+68,PASSPORT.y+131,  PERSON.passEXP, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+55,PASSPORT.y+147,  PERSON.ID, BROWN,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+8,PASSPORT.y+106,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if PERSON.passport==7 then
		end
		if PERSON.passport==8 then
			GPU_DrawText(PASSPORT.x+8,PASSPORT.y+97, PERSON.name, BROWN,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+25,PASSPORT.y+111, PERSON.DOB, DOCUMENTS_WHITE,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+25,PASSPORT.y+119,  PERSON.GNDR, DOCUMENTS_WHITE,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+25,PASSPORT.y+127,  PERSON.COL, DOCUMENTS_WHITE,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+25,PASSPORT.y+135,  PERSON.passEXP, DOCUMENTS_WHITE,"l",320,SMALL_FONT,7)
			GPU_DrawText(PASSPORT.x+10,PASSPORT.y+145,  PERSON.ID, DOCUMENTS_WHITE,"l",320,SMALL_FONT,7)
			Graphics.drawPartialImage(PASSPORT.x+84,PASSPORT.y+107,40*(face - (11*(math.ceil((face-0.1)/11)-1)+1)),48*(math.ceil((face-0.1)/11)-1),40,48, FACE[5])
		end
		if stamp=="NO" then
			Graphics.drawPartialImage(PASSPORT.x+state2x,PASSPORT.y+state2y,statesp1,statesp2,statesp3,statesp4, NOSTAMP)
			elseif stamp=="YES" then
			Graphics.drawPartialImage(PASSPORT.x+state2x,PASSPORT.y+state2y,statesp1,statesp2,statesp3,statesp4, YESSTAMP)
		end
		elseif key=="ENTRYTICKET" then
		GPU_DrawText(ENTRYTICKET.x+72,ENTRYTICKET.y+30, PERSON.ticketEXP, ENTRYTICKET_BROWN,320,NORMAL_FONT,8)
		elseif key=="ENTRYPERMIT" then
		if Options.TextAlign==1 then
			GPU_DrawText(ENTRYPERMIT.x+75,ENTRYPERMIT.y+89, string.upper(PERSON.permitname), ENTRYTICKET_BROWN,"c",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+75,ENTRYPERMIT.y+120, string.upper(PERSON.permitid), ENTRYTICKET_BROWN,"c",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+90,ENTRYPERMIT.y+137, string.upper(PERSON.permitpurpose), ENTRYTICKET_BROWN,"c",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+90,ENTRYPERMIT.y+153, string.upper(PERSON.permitduration), ENTRYTICKET_BROWN,"c",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+90,ENTRYPERMIT.y+169, string.upper(PERSON.permitenterby), ENTRYTICKET_BROWN,"c",320,NORMAL_FONT,8)
			elseif Options.TextAlign==0 then
			GPU_DrawText(ENTRYPERMIT.x+25,ENTRYPERMIT.y+89, string.upper(PERSON.permitname), ENTRYTICKET_BROWN,"l",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+25,ENTRYPERMIT.y+120, string.upper(PERSON.permitid), ENTRYTICKET_BROWN,"l",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+60,ENTRYPERMIT.y+137, string.upper(PERSON.permitpurpose), ENTRYTICKET_BROWN,"l",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+60,ENTRYPERMIT.y+153, string.upper(PERSON.permitduration), ENTRYTICKET_BROWN,"l",320,NORMAL_FONT,8)
			GPU_DrawText(ENTRYPERMIT.x+60,ENTRYPERMIT.y+169, string.upper(PERSON.permitenterby), ENTRYTICKET_BROWN,"l",320,NORMAL_FONT,8)
		end
		elseif key=="IDCARD" then
		GPU_DrawText(IDCARD.x+8,IDCARD.y+11, string.upper(PERSON.idcarddistrict).." DISTRICT", IDCARD_WCOLOR,"l",320,NORMAL_FONT,8)
		GPU_DrawText(IDCARD.x+49,IDCARD.y+19, string.upper(PERSON.idcardlastname)..",", IDCARD_BCOLOR,"l",320,NORMAL_FONT,8)
		GPU_DrawText(IDCARD.x+49,IDCARD.y+29, string.upper(PERSON.idcardfirstname), IDCARD_BCOLOR,"l",320,NORMAL_FONT,8)
		GPU_DrawText(IDCARD.x+65,IDCARD.y+39, string.upper(PERSON.idcardDOB), IDCARD_BCOLOR,"l",320,NORMAL_FONT,8)
		GPU_DrawText(IDCARD.x+65,IDCARD.y+49, string.upper(PERSON.idcardheight), IDCARD_BCOLOR,"l",320,NORMAL_FONT,8)
		GPU_DrawText(IDCARD.x+65,IDCARD.y+59, string.upper(PERSON.idcardweight), IDCARD_BCOLOR,"l",320,NORMAL_FONT,8)
		Graphics.drawPartialImage(IDCARD.x+4,IDCARD.y+17,40*(PERSON.idcardface - (11*(math.ceil((PERSON.idcardface-0.1)/11)-1)+1)),48*(math.ceil((PERSON.idcardface-0.1)/11)-1),40,48, FACE[5])
		elseif key=="WORKPASS" then
		if Options.TextAlign==1 then
			GPU_DrawText(WORKPASS.x+85,WORKPASS.y+63, string.upper(PERSON.WORKPASSholder), WORKPASS_COLOR,"c",320,NORMAL_FONT,8)
			GPU_DrawText(WORKPASS.x+85,WORKPASS.y+79, string.upper(PERSON.WORKPASSfield), WORKPASS_COLOR,"c",320,NORMAL_FONT,8)
			GPU_DrawText(WORKPASS.x+85,WORKPASS.y+95, string.upper(PERSON.WORKPASSuntil), WORKPASS_COLOR,"c",320,NORMAL_FONT,8)
			elseif Options.TextAlign==0 then
			GPU_DrawText(WORKPASS.x+40,WORKPASS.y+63, string.upper(PERSON.WORKPASSholder), WORKPASS_COLOR,"l",320,NORMAL_FONT,8)
			GPU_DrawText(WORKPASS.x+36,WORKPASS.y+79, string.upper(PERSON.WORKPASSfield), WORKPASS_COLOR,"l",320,NORMAL_FONT,8)
			GPU_DrawText(WORKPASS.x+36,WORKPASS.y+95, string.upper(PERSON.WORKPASSuntil), WORKPASS_COLOR,"l",320,NORMAL_FONT,8)
		end
		elseif key=="TRANSCRIPT" then
		if Options.Dialog==1 then
			for i=1, #CHAT do 
				if CHATplace[i]==1 then
					Graphics.drawImage(TRANSCRIPT.x+11,TRANSCRIPT.y+12+9*(i-1),TRANSCRIPT.tex3)
					GPU_DrawText(TRANSCRIPT.x+12,TRANSCRIPT.y+13+9*(i-1), string.upper(CHAT[i]), TRANSCRIPTBLUE,"l",320,NORMAL_FONT,8)
					elseif CHATplace[i]==2 then
					GPU_DrawText(TRANSCRIPT.x+137,TRANSCRIPT.y+13+9*(i-1), string.upper(CHAT[i]), TRANSCRIPTBROWN,"r",320,NORMAL_FONT,8)
				end
			end
		end
	end
end
function STAMP_CODE()
	if TOUCHx>=STAMP.x and TOUCHx<=STAMP.x+10 and TOUCHy>=47 and TOUCHy<=104 and STAMP.state=="CLOSED" and TOUCH=="ACTIVE" then
		STAMP.state="OPENED"
		STAMP.velocity=23
		TOUCH="STAMP"
		STAMP.gravity = 0
	end
	if TOUCHx>=STAMP.x and TOUCHx<=STAMP.x+10 and TOUCHy>=47 and TOUCHy<=104 and STAMP.state=="OPENED" and TOUCH=="ACTIVE" then 
		STAMP.state="CLOSED"
		STAMP.velocity=0
		TOUCH="STAMP"
		STAMP.gravity = 0
	end
	if STAMP.x > 40 and STAMP.state=="OPENED" then
		STAMP.gravity = 1
		elseif STAMP.state=="OPENED" then
		STAMP.gravity = 0 
	end
	if STAMP.x < 310 and STAMP.state=="CLOSED" then
		STAMP.gravity = 1
		elseif STAMP.state=="CLOSED" then
		STAMP.gravity = 0 
	end
	if STAMP.state=="OPENED" and STAMP.x > 40 and STAMP.velocity > 0 and Timer.getTime(timer) >= 10 then
		Timer.reset(timer)
		Timer.resume(timer)
		STAMP.velocity = STAMP.velocity - STAMP.gravity
		STAMP.x = STAMP.x - STAMP.velocity
	end
	if STAMP.state=="CLOSED" and STAMP.x < 310 and Timer.getTime(timer) >= 10 then
		Timer.reset(timer)
		Timer.resume(timer)
		STAMP.velocity = STAMP.velocity + STAMP.gravity
		STAMP.x = STAMP.x + STAMP.velocity
	end
	if STAMP.x<40 and STAMP.state=="OPENED" then STAMP.x=40 end
	if STAMP.x>310 and STAMP.state=="CLOSED" then STAMP.x=310 end
	if STAMP.state=="OPENED" and TOUCHx>=40+40 and TOUCHy>=22 and TOUCHx<=40+115 and TOUCHy<=22+87 and STAMP.velocity==0 then
		TOUCH="ACTIVE3"
		if STAMP.red<38 then
			STAMP.red=STAMP.red+4
			if STAMP.red>=38 then
				if PASSPORT.x ~= nil then
					if PASSPORT.x+130>STAMP.x+40 and PASSPORT.x<STAMP.x+40+75 and PASSPORT.y<38+87 and PASSPORT.y+162>38+57 and PASSPORT.now==0 then
						statex=STAMP.x+42-PASSPORT.x
						statey=STAMP.red+57-PASSPORT.y
						if statex>=0 and statex<=130 then 
							state2x=statex
							statesp1=0
							elseif statex<0 then
							state2x=0
							statesp1=-statex
							else
							statesp1=nil
						end
						if statey>=0 and statey<=162 then
							state2y=statey
							statesp2=0
							elseif statey<0 then
							state2y=0
							statesp2=-statey
							else
							statesp2=nil
						end
						if statey+30<=162 and statey>0 then
							statesp4=30
							elseif statey<=0 and statey>-30 then
							statesp4=30+statey
							elseif statey+30>162 then
							statesp4=162-statey
							else
							statesp4=nil
						end
						if statex+70<=130 and statex>0 then
							statesp3=70
							elseif statex<=0 and statex>-70 then
							statesp3=70+statex
							elseif statex+70>130 then
							statesp3=130-statex
							else
							statesp3=nil
						end
						if statesp1~=nil and statesp2~=nil and statesp3~=nil and statesp4~= nil then 
							stamp="NO" 
							else 
							stamp=nil 
						end
						
					end
				end
			end
		end
		else
		if STAMP.red>22 then
			STAMP.red=STAMP.red-4
		end
	end
	if STAMP.state=="OPENED" and TOUCHx>=40+160 and TOUCHy>=22 and TOUCHx<=40+235 and TOUCHy<=22+87 and STAMP.velocity==0 then
		TOUCH="ACTIVE3"
		if STAMP.green<38 then
			STAMP.green=STAMP.green+4
		end
		if STAMP.green>=38 then
			if PASSPORT.x ~= nil then
				if PASSPORT.x+130>STAMP.x+160 and PASSPORT.x<STAMP.x+160+75 and PASSPORT.y<38+87 and PASSPORT.y+162>38+57 and PASSPORT.now==0 then
					statex=STAMP.x+162-PASSPORT.x
					statey=STAMP.green+57-PASSPORT.y
					if statex>=0 and statex<=130 then 
						state2x=statex
						statesp1=0
						elseif statex<0 then
						state2x=0
						statesp1=-statex
						else
						statesp1=nil
					end
					if statey>=0 and statey<=162 then
						state2y=statey
						statesp2=0
						elseif statey<0 then
						state2y=0
						statesp2=-statey
						else
						statesp2=nil
					end
					if statey+30<=162 and statey>0 then
						statesp4=30
						elseif statey<=0 and statey>-30 then
						statesp4=30+statey
						elseif statey+30>162 then
						statesp4=162-statey
						else
						statesp4=nil
					end
					if statex+70<=130 and statex>0 then
						statesp3=70
						elseif statex<=0 and statex>-70 then
						statesp3=70+statex
						elseif statex+70>130 then
						statesp3=130-statex
						else
						statesp3=nil
					end
					if statesp1~=nil and statesp2~=nil and statesp3~=nil and statesp4~= nil then 
						stamp="YES"  
						else 
						stamp=nil 
					end
					
				end
			end
		end
		else
		if STAMP.green>22 then
			STAMP.green=STAMP.green-4
		end
	end
end
function GENDERGENERATOR()
	local a=0
	if (PERSON.face>=1 and PERSON.face<=4) or (PERSON.face>=29 and PERSON.face<=44) then a = "F" else a="M" end
	return a
end
function NAMEGENERATOR()
	if PERSON.GNDR=="M" then 
		return tostring(MNAMES.FN[math.random(1,#MNAMES.FN)]),tostring(MNAMES.LN[math.random(1,#MNAMES.LN)]) 
		else	
		return tostring(FNAMES.FN[math.random(1,#FNAMES.FN)]),tostring(FNAMES.LN[math.random(1,#FNAMES.LN)]) 
	end
end
function PURPOSEGENERATOR()
	local a
	a = math.random(1,4)
	if a==1 then
		a="TRANSIT" 
		table.insert(CHAT,#CHAT+1,"Transit")
		table.insert(CHATplace,#CHATplace+1,2)
	end
	if a==2 then 
		a="VISIT" 
		table.insert(CHAT,#CHAT+1,"Visiting")
		table.insert(CHATplace,#CHATplace+1,2)
	end
	if a==3 then 
		a="IMMIGRATE" 
		table.insert(CHAT,#CHAT+1,"Immigrating")
		table.insert(CHATplace,#CHATplace+1,2)
	end
	
	if a==4 then 
		a="WORK" 
		table.insert(CHAT,#CHAT+1,"Working")
		table.insert(CHATplace,#CHATplace+1,2)
	end
	return a
end
function DURATIONGENERATOR()
	local a
	local b
	if PERSON.permitpurpose=="TRANSIT" then 
		a=math.random(1,2)
		if a==1 then a="2 DAYS" 
			b = math.random(1,2)
			if b==1 then b="Just 2 days" elseif b==2 then b="Couple a days" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			else 
			a="14 DAYS" 
			b=math.random(1,3)
			if b==1 then b="Couple weeks" elseif b==2 then b="Just 14 days" elseif b==3 then b="Only two weeks" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
		end
		elseif PERSON.permitpurpose=="VISIT" then
		a=math.random(1,4)
		if a==1 then 
			
			a="14 DAYS" 
			b=math.random(1,3)
			if b==1 then b="Couple weeks" elseif b==2 then b="Just 14 days" elseif b==3 then b="Only two weeks" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==2 then
			
			a="1 MONTH" 
			b=math.random(1,3)
			if b==1 then b="30 days" elseif b==2 then b="A few weeks" elseif b==3 then b="One month" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==3 then
			
			a="2 MONTHS" 
			b=math.random(1,4)
			if b==1 then b="60 days" elseif b==2 then b="8 weeks" elseif b==3 then b="Couple months" elseif b==4 then b="Two months" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==4 then
			
			a="3 MONTHS" 
			b=math.random(1,4)
			if b==1 then b="90 days" elseif b==2 then b="12 weeks" elseif b==3 then b="Three months" elseif b==4 then b="A few months" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
		end
		elseif PERSON.permitpurpose=="IMMIGRATE" then
		a="FOREVER"
		b=math.random(1,2)
		if b==1 then b="Forever" elseif b==2 then b="Until i die" end
		table.insert(CHAT,#CHAT+1,b)
		table.insert(CHATplace,#CHATplace+1,2)
		elseif PERSON.permitpurpose=="WORK" then
		a=math.random(1,5)
		if a==1 then 
			a="1 MONTH" 
			b=math.random(1,3)
			if b==1 then b="30 days" elseif b==2 then b="A few weeks" elseif b==3 then b="One month" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==2 then 
			a="2 MONTHS" 
			b=math.random(1,4)
			if b==1 then b="60 days" elseif b==2 then b="8 weeks" elseif b==3 then b="Couple months" elseif b==4 then b="Two months" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==3 then 
			a="3 MONTHS" 
			b=math.random(1,4)
			if b==1 then b="90 days" elseif b==2 then b="12 weeks" elseif b==3 then b="Three months" elseif b==4 then b="A few months" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==4 then 
			a="6 MONTHS" 
			b=math.random(1,2)
			if b==1 then b="Six months" elseif b==2 then b="Half a year" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
			elseif a==5 then 
			a="1 Year" 
			b=math.random(1,3)
			if b==1 then b="One year" elseif b==2 then b="Full year" elseif b==3 then b="A year" end
			table.insert(CHAT,#CHAT+1,b)
			table.insert(CHATplace,#CHATplace+1,2)
		end
	end
	return a
end
function DATEGENERATOR(validornat)
	local a
	local b
	local c
	local d=0
	local e=0
	if validornat=="y" then
		d = today.year*10000+today.month*100+today.day
		e = 0
		while d > e do
			a = math.random(today.year,today.year+2)
			b = math.random(1,12)
			c = math.random(1,30)
			e = a*10000+b*100+c
		end
		elseif validornat=="n" then
		d = today.year*10000+today.month*100+today.day
		e = 100000000
		while d <= e do
			a = math.random(today.year-2,today.year)
			b = math.random(1,12)
			c = math.random(1,30)
			e = a*10000+b*100+c
		end
	end
	e = c.."."..b.."."..a
	return e
end
function RANDOMIZE()
	local wrong = 0
	for i=1,#DESKTOP do table.remove(DESKTOP,1) end
	for i=1,#ALLITEMS do table.remove(ALLITEMS,1) end
	for i=1,#CHAT do table.remove(CHAT,1) end
	for i=1,#CHATplace do table.remove(CHATplace,1) end
	table.insert(DESKTOP,1,"TRANSCRIPT")
	table.insert(ALLITEMS,1,TRANSCRIPT)
	IDCARD.x=145
	IDCARD.y=-200
	IDCARD.now=1
	PASSPORT.x=145
	PASSPORT.y=-200
	PASSPORT.now=1
	ENTRYPERMIT.x=145 
	ENTRYPERMIT.y=-200
	ENTRYPERMIT.now=1
	WORKPASS.x=145 
	WORKPASS.y=-200
	WORKPASS.now=1
	ENTRYTICKET.rot = math.random(-4,4)/10
	ENTRYPERMIT.rot =  math.random(-4,4)/10
	IDCARD.rot =  math.random(-4,4)/10
	PASSPORT.rot =  math.random(-4,4)/10
	WORKPASS.rot =  math.random(-4,4)/10
	table.insert(DESKTOP,1,"RULEBOOK")
	table.insert(DESKTOP,1,"PASSPORT")
	table.insert(ALLITEMS,1,RULEBOOK)
	table.insert(ALLITEMS,1,PASSPORT)
	table.insert(CHAT,#CHAT+1,"Papers Please")
	table.insert(CHATplace,#CHATplace+1,1)
	local faces = PERSON.face
	while faces == PERSON.face do
		PERSON.face = math.random(1,44)
	end
	PERSON.realface = PERSON.face
	PERSON.passport = math.random(1,8)
	while PERSON.passport==7 do
		PERSON.passport = 2
	end
	PERSON.GNDR = GENDERGENERATOR()
	PERSON.idcardfirstname,PERSON.idcardlastname=NAMEGENERATOR()
	PERSON.name = tostring(PERSON.idcardfirstname.." "..PERSON.idcardlastname)
	PERSON.DOB =tostring(math.random(1,30).."."..math.random(1,12).."."..math.random(1960,1990))
	PERSON.COL = FORDOCUMENT[PERSON.passport][math.random(1,3)]
	PERSON.passEXP=DATEGENERATOR("y")
	PERSON.ID=makeString(5).."-"..makeString(5)
	if PERSON.passport==2 then
		table.insert(DESKTOP,1,"IDCARD")
		table.insert(ALLITEMS,1,IDCARD)
		PERSON.idcarddistrict=DISTRICTS[math.random(1,#DISTRICTS)]
		PERSON.idcardDOB=tostring(PERSON.DOB)
		PERSON.idcardheight = HEIGHTGENERATOR()
		PERSON.idcardweight = math.random(40,90)
		PERSON.idcardface=PERSON.face
		PERSON.height=PERSON.idcardheight
		PERSON.weight=PERSON.idcardweight
		else
		table.insert(DESKTOP,1,"ENTRYPERMIT")
		table.insert(ALLITEMS,1,ENTRYPERMIT)
		local AskPurpose=math.random(1,3)
		if AskPurpose==1 then AskPurpose="What's Purpose?"
			elseif AskPurpose==2 then AskPurpose="What's Reason?"
			elseif AskPurpose==3 then AskPurpose="Purpose of the trip?"
		end
		table.insert(CHAT,#CHAT+1,AskPurpose)
		table.insert(CHATplace,#CHATplace+1,1)
		PERSON.permitname=PERSON.name
		PERSON.permitid=tostring(PERSON.ID)
		PERSON.permitpurpose=tostring(PURPOSEGENERATOR())
		local AskDuration=math.random(1,3)
		if AskDuration==1 then AskDuration="What's Duration?"
			elseif AskDuration==2 then AskDuration="How long?"
			elseif AskDuration==3 then AskDuration="Duration of the trip?"
		end
		table.insert(CHAT,#CHAT+1,AskDuration)
		table.insert(CHATplace,#CHATplace+1,1)
		PERSON.permitduration=tostring(DURATIONGENERATOR())
		PERSON.permitenterby=DATEGENERATOR("y")
		PERSON.height=HEIGHTGENERATOR()
		PERSON.weight=math.random(40,90)
	end
	if PERSON.permitpurpose=="WORK" and PERSON.passport~=2 then
		table.insert(DESKTOP,1,"WORKPASS")
		table.insert(ALLITEMS,1,WORKPASS)
		PERSON.WORKPASSholder=PERSON.name
		PERSON.WORKPASSfield=FIELDS[math.random(1,#FIELDS)]
		PERSON.WORKPASSuntil=DATEGENERATOR("y")
	end
	
	wrong = math.random(1,#WRONGTABLE)
	if wrong==4 then
		if PERSON.passport==2 then
			if PERSON.idcardDOB == PERSON.DOB then
				PERSON.idcardDOB = math.random(1,30).."."..math.random(1,12).."."..math.random(1960,1990)
			end
			if PERSON.idcardDOB == PERSON.DOB then
				PERSON.idcardDOB = math.random(1,30).."."..math.random(1,12).."."..math.random(1960,1990)
			end
			if PERSON.idcardDOB == PERSON.DOB then
				wrong=1 
			end
			else 
			wrong=1
		end
		elseif wrong==5 then
		PERSON.COL = FORDOCUMENTFAKE[PERSON.passport][math.random(1,3)]
		elseif wrong==6 then
		if PERSON.passport==2 then
			PERSON.idcarddistrict=FAKEDISTRICTS[math.random(1,#FAKEDISTRICTS)]
			else 
			wrong=1
		end
		elseif wrong==7 then
		while PERSON.name == tostring(PERSON.idcardfirstname.." "..PERSON.idcardlastname) do
			PERSON.idcardfirstname,PERSON.idcardlastname=NAMEGENERATOR()
		end
		while PERSON.permitname==PERSON.name do
			PERSON.idcardfirstname,PERSON.idcardlastname=NAMEGENERATOR()
			PERSON.permitname = tostring(PERSON.idcardfirstname.." "..PERSON.idcardlastname)
		end
		elseif wrong==8 then
		if PERSON.GNDR=="M" then 
			PERSON.GNDR="F"
			else	
			PERSON.GNDR="M"
		end
		elseif wrong==9 then
		if PERSON.passport~=2 then
			while PERSON.permitid==tostring(PERSON.ID) do
				PERSON.permitid=tostring(makeString(5).."-"..makeString(5))
			end
			else 
			wrong=1
		end
		elseif wrong==10 then
		if PERSON.passport==2 then
			PERSON.idcardheight = PERSON.idcardheight - math.random(7,10)
			else 
			wrong=1
		end
		elseif wrong==11 then
		if PERSON.passport==2 then
			PERSON.idcardweight = PERSON.weight - math.random(2,5)
			else 
			wrong=1
		end
		elseif wrong==12 then
		PERSON.idcardface = math.random(1,44)
		PERSON.face = PERSON.idcardface
		if PERSON.idcardface==PERSON.realface then
			wrong=1
		end
		elseif wrong==14 then
		PERSON.passEXP=DATEGENERATOR("n")
		elseif wrong==15 then
		PERSON.permitenterby=DATEGENERATOR("n")
	end
	LASTWRONGCONST = WRONGCONST
	WRONGCONST=WRONGTABLE[wrong]
	stamp=nil
end
function TECHMENU()
	TECHMENUenable = 0
	if Controls.check(pad,KEY_SELECT) then
		TECHMENUenable = 1
	end
	if TECHMENUenable==1 then
		Graphics.fillRect(0,400,0,103,BLACK)
		if stamp==nil then
			GPU_DrawText(0,0,"Stamp - not found",WHITE,"l",400,NORMAL_FONT,8)
			elseif stamp=="YES" then
			GPU_DrawText(0,0,"Stamp - "..stamp,GREEN,"l",400,NORMAL_FONT,8)
			elseif stamp=="NO" then
			GPU_DrawText(0,0,"Stamp - "..stamp,RED,"l",400,NORMAL_FONT,8)
		end
		GPU_DrawText(0,8,"FaceId - "..PERSON.face,WHITE,"l",400,NORMAL_FONT,8)
		GPU_DrawText(0,16,"StateOfCage - "..SWITCHER ,WHITE,"l",400,NORMAL_FONT,8)
		GPU_DrawText(0,24,"TouchX-TouchY: "..TOUCHx.." - "..TOUCHy ,WHITE,"l",400,NORMAL_FONT,8)
		if TOUCH~=nil then
			GPU_DrawText(0,32,"ActiveItem - "..TOUCH ,WHITE,"l",400,NORMAL_FONT,8)
			else
			GPU_DrawText(0,32,"ActiveItem - NOTHING" ,WHITE,"l",400,NORMAL_FONT,8)
		end
		if TOUCH=="PASSPORT" then
			GPU_DrawText(0,40, PERSON.passport,WHITE,"l",400,NORMAL_FONT,8)
		end
		GPU_DrawText(0,48,"Last Wrong - "..LASTWRONGCONST,WHITE,"l",400,NORMAL_FONT,8)
		GPU_DrawText(0,64,"Now Wrong - "..WRONGCONST  ,WHITE,"l",400,NORMAL_FONT,8)
		
		if stamp==nil then
			GPU_DrawText(0,72,"STAMP the PASSPORT and Check this line",GREEN,"l",400,NORMAL_FONT,8)
			elseif stamp=="YES" and WRONGCONST=="Nothing" then
			GPU_DrawText(0,72,"YOU ARE CORRECT",GREEN,"l",400,NORMAL_FONT,8)
			elseif stamp=="NO" and WRONGCONST~="Nothing" then
			GPU_DrawText(0,72,"YOU ARE CORRECT",GREEN,"l",400,NORMAL_FONT,8)
			else
			GPU_DrawText(0,72,"YOU ARE NOT CORRECT",RED,"l",400,NORMAL_FONT,8)
		end
	end
end
function HEIGHTGENERATOR()
	local a = 0
	if PERSON.face==1 then a=math.random(165,171)
		elseif PERSON.face==2 then a=math.random(165,171)
		elseif PERSON.face==3 then a=math.random(164,170)
		elseif PERSON.face==4 then a=math.random(161,164)
		elseif PERSON.face==5 then a=math.random(181,184)
		elseif PERSON.face==6 then a=math.random(164,170)
		elseif PERSON.face==7 then a=math.random(178,182)
		elseif PERSON.face==8 then a=math.random(175,181)
		elseif PERSON.face==9 then a=math.random(179,183)
		elseif PERSON.face==10 then a=math.random(170,173)
		elseif PERSON.face==11 then a=math.random(178,182)
		elseif PERSON.face==12 then a=math.random(173,179)
		elseif PERSON.face==13 then a=math.random(177,181)
		elseif PERSON.face==14 then a=math.random(173,179)
		elseif PERSON.face==15 then a=math.random(179,183)
		elseif PERSON.face==16 then a=math.random(179,183)
		elseif PERSON.face==17 then a=math.random(169,173)
		elseif PERSON.face==18 then a=math.random(178,182)
		elseif PERSON.face==19 then a=math.random(165,171)
		elseif PERSON.face==20 then a=math.random(169,174)
		elseif PERSON.face==21 then a=math.random(164,169)
		elseif PERSON.face==22 then a=math.random(164,170)
		elseif PERSON.face==23 then a=math.random(165,171)
		elseif PERSON.face==24 then a=math.random(179,183)
		elseif PERSON.face==25 then a=math.random(180,183)
		elseif PERSON.face==26 then a=math.random(178,182)
		elseif PERSON.face==27 then a=math.random(181,184)
		elseif PERSON.face==28 then a=math.random(180,183)
		elseif PERSON.face==29 then a=math.random(173,179)
		elseif PERSON.face==30 then a=math.random(161,164)
		elseif PERSON.face==31 then a=math.random(169,173)
		elseif PERSON.face==32 then a=math.random(175,181)
		elseif PERSON.face==33 then a=math.random(171,174)
		elseif PERSON.face==34 then a=math.random(178,182)
		elseif PERSON.face==35 then a=math.random(169,174)
		elseif PERSON.face==36 then a=math.random(168,172)
		elseif PERSON.face==37 then a=math.random(171,174)
		elseif PERSON.face==38 then a=math.random(173,179)
		elseif PERSON.face==39 then a=math.random(173,179)
		elseif PERSON.face==40 then a=math.random(175,181)
		elseif PERSON.face==41 then a=math.random(165,171)
		elseif PERSON.face==42 then a=math.random(171,174)
		elseif PERSON.face==43 then a=math.random(169,174)
		elseif PERSON.face==44 then a=math.random(161,164)
	end
	return a
end
function DIALOG_SYSTEM()
	for i=1, #CHAT do
		if FACE.x==126 and SWITCHER==0 then
			if  Timer.getTime(CBtime)>1000*(i-1) then
				if CHATplace[i]==2 then
					CHATx[i] = CHATx[i] or 210
					if CHATx[i] < 290 then
						Graphics.drawImage(CHATx[i], 103+(i-1)*12, SB)
						GPU_DrawText(CHATx[i]+2,106+(i-1)*12,CHAT[i] ,BROWN2,"l",400,SMALL_FONT,7)
						if Timer.getTime(CBtime)>3000+1000*(i-1) then
							CHATx[i] = CHATx[i] + 5
						end
					end
					else
					CHATx[i] = CHATx[i] or 112
					if CHATx[i] > 32 then
						Graphics.drawImage(CHATx[i], 103+(i-1)*12, SB)
						GPU_DrawText(CHATx[i]+2,106+(i-1)*12,CHAT[i] ,BROWN2,"l",400,SMALL_FONT,7)
						if Timer.getTime(CBtime)>3000+1000*(i-1) then
							CHATx[i] = CHATx[i] - 5
						end
					end
				end
			end
			else
			if SWITCHER==1 then
				else
				Timer.reset(CBtime)
				CHATx[i] = nil
			end
		end
	end
end
function CHECK_EMPTYTABLE()
	if #DESKTOP<3 then
		if stamp == "YES" and WRONGCONST == "Nothing" and CheckPoint==0 then
			SCORE=SCORE + 1
			elseif stamp == "YES" and WRONGCONST ~="Nothing" and CheckPoint==0 then
			SCORE=SCORE - 1 
			elseif stamp == "NO" and WRONGCONST ~="Nothing" and CheckPoint==0 then
			SCORE=SCORE + 1
			elseif stamp == "NO" and WRONGCONST =="Nothing" and CheckPoint==0 then
			SCORE=SCORE - 1 
		end
		if CheckPoint==0 then CheckPoint=2 end
		if stamp == "YES" and WRONGCONST == "Nothing" and CheckPoint==2 then
			FACE.x=FACE.x + 2.5
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
			elseif stamp == "YES" and WRONGCONST ~="Nothing" and CheckPoint==2 then
			FACE.x=FACE.x + 2.5
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
			elseif stamp == "NO" and WRONGCONST ~="Nothing" and CheckPoint==2 then
			FACE.x=FACE.x - 2.5
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
			elseif stamp == "NO" and WRONGCONST =="Nothing" and CheckPoint==2 then
			FACE.x=FACE.x - 2.5
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
		end
	end
end
function LOAD_CLOCK()
	if today.day<10 and today.month>9 then
		GPU_DrawText(358,228,"0"..today.day.."."..today.month.."."..(today.year % 100) ,BROWN2,"l",400,DIGITS,5)
		elseif today.day<10 and today.month<10 then
		GPU_DrawText(358,228,"0"..today.day..".0"..today.month.."."..(today.year % 100) ,BROWN2,"l",400,DIGITS,5)
		elseif today.day>9 and today.month<10 then
		GPU_DrawText(358,228,today.day..".0"..today.month.."."..(today.year % 100) ,BROWN2,"l",400,DIGITS,5)
		else
		GPU_DrawText(358,228,today.day.."."..today.month.."."..(today.year % 100) ,BROWN2,"l",400,DIGITS,5)
	end
	if Timer.getTime(Clock)>1000 then
		clockInt=clockInt+pi/30
		Timer.reset(Clock)
	end
	Graphics.drawRotateImage(322,224, clockHOUR,clockInt/10,Color.new(86,62,37))
	Graphics.drawRotateImage(322,224, clockMINUTE,clockInt,Color.new(86,62,37))
	Graphics.drawRotateImage(323,225, clockHOUR,clockInt/10,Color.new(66,42,28))
	Graphics.drawRotateImage(323,225, clockMINUTE,clockInt,Color.new(66,42,28))
end
while true do
	Sound.updateStream()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.clear(BOTTOM_SCREEN)
	TOUCHx,TOUCHy = Controls.readTouch()
	STICK.x,STICK.y = Controls.readCirclePad()
	pad = Controls.read()
	OptionsOP()
	if menu==2 then
		Graphics.initBlend(BOTTOM_SCREEN)
		for i=1, #DESKTOP do
			if TOUCH == DESKTOP[i] then 
				table.remove(DESKTOP,i) 
				table.insert(DESKTOP,1,TOUCH)
			end
		end
		STAMP_CODE()
		for i = 1 ,#DESKTOP do
			for k = 1,#ALLITEMS do
				if DESKTOP[i]==ALLITEMS[k].key then TOUCH_CHECK(ALLITEMS[k],ALLITEMS[k].key) end
			end
		end
		if TOUCH~="ACTIVE" and TOUCHx==0 and TOUCHy==0 then
			TOUCH="ACTIVE"
		end
		if TOUCH=="ACTIVE" and TOUCHx>0 and TOUCHy>0 then
			TOUCH="NOTHING"
		end
		Graphics.drawPartialImage(0, 67, 0, 77, 320, 173, BKG_BTMS)
		for i = 1,#DESKTOP do
			for k=1,#ALLITEMS do
				if DESKTOP[#DESKTOP-i+1]==ALLITEMS[k].key and ALLITEMS[k].now==0 then LOAD_IMAGE(ALLITEMS[k],ALLITEMS[k].key) end
			end
		end
		Graphics.drawPartialImage(0, 0, 0, 0, 320, 77, BKG_BTMS)
		for i = 1,#DESKTOP do
			for k=1,#ALLITEMS do
				if DESKTOP[#DESKTOP-i+1]==ALLITEMS[k].key and ALLITEMS[k].now==1 then LOAD_IMAGE(ALLITEMS[k],ALLITEMS[k].key) end
			end
		end
		if stamp==nil then
			Graphics.drawPartialImage(117, 0, 117, 0, 87, 8, BKG_BTMS)
		end
		Graphics.drawPartialImage(STAMP.x,STAMP.y, 0, 0, 280, 47, STMP_SPRITE)
		if STAMP.x<300 then
			Graphics.drawPartialImage(STAMP.x+40,STAMP.red, 0, 82, 75, 87, STMP_SPRITE)
			Graphics.drawPartialImage(STAMP.x+160,STAMP.green, 75, 82, 75, 87, STMP_SPRITE)
		end
		Graphics.drawPartialImage(STAMP.x,STAMP.y+47, 0, 46, 280, 36, STMP_SPRITE)
		screenshotmake()
		Graphics.termBlend()
		Graphics.initBlend(TOP_SCREEN)
		
		Graphics.drawImage(112,104, WALL_TXR)
		BKG_SHDW()
		LOAD_FACE(PERSON.realface)
		if CheckPoint==1 and Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) then
			PEOPLESCORE = PEOPLESCORE + 1
			RANDOMIZE()
			CheckPoint=0
		end
		if (FACE.x>276 or FACE.x<-24) and stamp~=nil and CheckPoint==2 then
			CheckPoint=1
			FACE.x = -24
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
		end
		if FACE.x<126 and stamp==nil then
			FACE.x = FACE.x+2.5
			FACE.y=-(5*math.cos(15*(FACE.x-126)))+109
			if FACE.x>120 and SWITCHER==1 then
				SWITCHER=0
			end
		end
		CHECK_EMPTYTABLE()
		CAGE_MOVE()
		MAP_MOVE()
		if Options.Dialog==1 then
			DIALOG_SYSTEM()
		end
		Graphics.drawImage(BKG_TPSX, 0, BKG_TPS)
		if CheckPoint==1 then
			Graphics.drawPartialImage(BKG_TPSX+146,65,0,0,56,38, CHSheet)
			Graphics.drawImage(BKG_TPSX+135, 43, SB)
			GPU_DrawText(BKG_TPSX+137,46,"Press A to Call next" ,BROWN2,"l",400,SMALL_FONT,7)
			else
			Graphics.drawPartialImage(BKG_TPSX+146,65,0,38,56,38, CHSheet)
		end
		if Options.Car==1 then
			CARs()
			if BKG_TPSX<-120 then
				Graphics.drawImage(BKG_TPSX+525,CAR.y,CARIMAGE)
			end
		end
		Graphics.drawPartialImage(0, 113, 0, 0, 400, 103, BKG_MONITORS)
		Graphics.drawPartialImage(0, 103, 0, 103, 400, 137, BKG_MONITORS)
		if TRANSCRIPT.x~=nil then
			if TRANSCRIPT.now==1 then
				Graphics.drawImage(TRANSCRIPT.x+40,TRANSCRIPT.y+255, TRANSCRIPT.tex2)
			end
		end
		Graphics.drawPartialImage(52, 200, 52, 200, 46, 34, BKG_MONITORS)
		if FACE.x==126 then
			if Options.TextAlign==1 then
				GPU_DrawText(22,220,PERSON.weight ,BROWN2,"c",400,DIGITS,5)
				elseif Options.TextAlign==0 then
				GPU_DrawText(15,220,PERSON.weight ,BROWN2,"l",400,DIGITS,5)
			end
			end
			if Options.TextAlign==1 then
				GPU_DrawText(53,110,SCORE ,BROWN2,"c",400,SMALL_FONT,7)
				elseif Options.TextAlign==0 then
				GPU_DrawText(44,110,SCORE ,BROWN2,"l",400,SMALL_FONT,7)
			end
			if Options.TextAlign==1 then
				if string.len(PEOPLESCORE)==1 then
					GPU_DrawText(65,215,"0"..PEOPLESCORE,BROWN3,"r",400,DIGITS,5)
					else
					GPU_DrawText(65,215,PEOPLESCORE,BROWN3,"r",400,DIGITS,5)
				end
				elseif Options.TextAlign==0 then
				if string.len(PEOPLESCORE)==1 then
					GPU_DrawText(83,215,"0"..PEOPLESCORE,BROWN3,"l",400,DIGITS,5)
					else
					GPU_DrawText(83,215,PEOPLESCORE,BROWN3,"l",400,DIGITS,5)
				end
			end
			LOAD_CLOCK()
			TECHMENU()
			screenshotmake()
			Graphics.termBlend()
			
			if Controls.check(pad,KEY_START) and Controls.check(oldpad,KEY_START) then
				menu=0   
			end
		elseif menu==0 then
		TOUCHx,TOUCHy = Controls.readTouch()
		Graphics.initBlend(TOP_SCREEN)
		Graphics.drawImage(0,TITLEy+265,Title)
		screenshotmake()
		Graphics.termBlend()
		Graphics.initBlend(BOTTOM_SCREEN)
		if TITLEy<-128 then
			ScreenButton(96,112,DEMObutton,2,DEMO)
			else
			ScreenButton(96,TITLEy+240,DEMObutton,2,DEMO)
		end
		if TITLEy<-240 then
			ScreenButton(303,0,EXITbutton,"Exit",EXIT)
			else
			ScreenButton(303,TITLEy+240,EXITbutton,"Exit",EXIT)
		end
		Graphics.drawImage(-40,TITLEy,Title)
		screenshotmake()
		Graphics.termBlend()
		if (TITLEy==-280 or TOUCHx>0 or TOUCHy>0) and TITLEi==0 then
			TITLEy=-280
			TITLEx=TITLEy+20
			TITLEi=1
		end
		time = Timer.getTime(timer)
		if time>1000 then 
			if TITLEy>-265 then
				TITLEx=TITLEx or TITLEy-20
				else
				TITLEx=TITLEx or TITLEy+20
			end
			if TITLEy>TITLEx then 
				TITLEy=TITLEy-2 
				elseif TITLEx>TITLEy then
				TITLEy=TITLEy+2 
				elseif TITLEx==TITLEy then
				TITLEx=nil
				Timer.reset(timer)
				Timer.resume(timer)
			end
		end
		elseif menu=="Exit" then
		GarbageCollection()
		if THEME_SONG then
			Sound.pause(THEME_SONG)
			Sound.close(THEME_SONG)
		end
		Sound.term()
		System.exit()
	end
	if Controls.check(pad,KEY_L) and activatescreenshot==0 and not Controls.check(oldpad,KEY_L)  then
		Th,Tm,Ts = System.getTime()
		System.takeScreenshot("/PapersPlease-"..Th.."-"..Tm.."-"..Ts..".bmp",false)
		activatescreenshot=255
	end
	Screen.flip()
	Screen.waitVblankStart()
	oldpad = pad
end

