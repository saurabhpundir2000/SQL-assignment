Add-Type -AssemblyName presentationCore

 $filepath = [uri] "D:\exp\ringtone.mp3"

 $wmplayer = New-Object System.Windows.Media.MediaPlayer

 $wmplayer.Open($filepath)
 
 Start-Sleep 2 # This allows the $wmplayer time to load the audio file

 $duration = $wmplayer.NaturalDuration.TimeSpan.TotalSeconds
 
 $wmplayer.Play()
 
 Start-Sleep $duration # to wait for the music to end
 
 $wmplayer.Stop() #stop music
 
 $wmplayer.Close() #close music player