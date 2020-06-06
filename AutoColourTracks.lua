--Automatically colour tracks based on what they contain in their name
--Set the custom track color, color is OS dependent (i.e. ColorToNative(r,g,b).
--Script written by Maya Engel (@MayaComposer)

instruments = {
  strings={"violin","cello","viola","contrabass"},
  brass={"horn","trumpet","tuba","trombone"},
  woodwinds={"flute","clarinet", "english horn","bassoon"} 
  } 
  
colours = {
  strings={38, 70, 83},
  brass={233, 196, 106},
  woodwinds={231, 111, 81}
  }
  

--get number of tracks in project
local amount_of_tracks = reaper.CountTracks()
reaper.ShowConsoleMsg("\n".."amount of tracks: "..amount_of_tracks)

--for i in all tracks do
for i=0,amount_of_tracks-1 do
  --debug
  reaper.ShowConsoleMsg("\n"..i)
  --get track
  local track = reaper.GetTrack(self, i)
  
  reaper.ShowConsoleMsg("\n".."track: "..tostring(track))
  
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
end
