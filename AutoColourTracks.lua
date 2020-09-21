--Automatically colour tracks based on what they contain in their name
--Set the custom track color, color is OS dependent (i.e. ColorToNative(r,g,b).
--Script written by Maya Engel (@MayaComposer)

--instrument families with their members
instruments = {
  strings={"Violin","Violincello","Viola","Contrabass", "Cello", "cello", "Erhu", "Bass", "Strings"},
  brass={"Horn","Trumpet","Tuba","Trombone"},
  woodwinds={"Flute","Clarinet", "Bassoon", "Oboe", "English Horn", "Piccolo", "Cor Anglais"},
  perc={"Timpani", "Drum", "Piano", "Harp", "Celesta"} 
  } 
  
--colours for each instrument family as RGB values
colours = {
  strings={157, 2, 8},
  brass={255, 190, 11},
  woodwinds={160, 196, 255},
  perc={131, 56, 236}
  }
  

--get number of tracks in project
local amount_of_tracks = reaper.CountTracks()
reaper.ShowConsoleMsg("\n".."amount of tracks: "..amount_of_tracks)

--for i in all tracks do
for i=0,amount_of_tracks-1 do
  --debug
 
  --get track
  local track = reaper.GetTrack(self, i)
  
  
  
  --get track name
  local success, name = reaper.GetTrackName(track)
  
  --match for each in instruments.strings
  for k, v in pairs(instruments.strings) do
    --if track name has any of the instruments in its name, set colour
    if string.find(name, v) then
      reaper.SetTrackColor(track, 
      reaper.ColorToNative(colours.strings[1],colours.strings[2],colours.strings[3]))
    end
  end
  
  --match for each in instruments.brass
  for k, v in pairs(instruments.brass) do
    --if track name has any of the instruments in its name, set colour
    if string.find(name, v) then
      reaper.SetTrackColor(track, 
      reaper.ColorToNative(colours.brass[1],colours.brass[2],colours.brass[3]))
    end
  end
  
  --match for each in instruments.woodwinds
  for k, v in pairs(instruments.woodwinds) do
      --if track name has any of the instruments in its name, set colour
      if string.find(name, v) then
        reaper.SetTrackColor(track, 
        reaper.ColorToNative(colours.woodwinds[1],colours.woodwinds[2],colours.woodwinds[3]))
      end
    end
  for k, v in pairs(instruments.perc) do
        --if track name has any of the instruments in its name, set colour
        if string.find(name, v) then
          reaper.SetTrackColor(track, 
          reaper.ColorToNative(colours.perc[1],colours.perc[2],colours.perc[3]))
        end
      end
    
  --reaper.ShowConsoleMsg("\n"..i)
  --reaper.ShowConsoleMsg("\n".."track: "..tostring(track))
end
