$Config = Get-Content .\config.json | ConvertFrom-Json
$AudioPlayback = Get-AudioDevice -Playback
$PlaybackDesktop = $Config.Desktop.Output
$PlaybackVR = $Config.VR.Output
Write-Output "Audio device was " $AudioPlayback.Name
Write-Output "Audio device now set to "

if ($AudioPlayback.Name.StartsWith("$PlaybackDesktop")) {
   (Get-AudioDevice -list | Where-Object Name -Like ("$PlaybackVR*") | Set-AudioDevice).Name
} Else {
   (Get-AudioDevice -list | Where-Object Name -Like ("$PlaybackDesktop*") | Set-AudioDevice).Name
}

$AudioRecording = Get-AudioDevice -Recording
$RecordingDesktop = $Config.Desktop.Input
$RecordingVR = $Config.VR.Input
Write-Output "Recording device was " $AudioRecording.Name
Write-Output "Recording device now set to "

if ($AudioRecording.Name.StartsWith("$RecordingDesktop")) {
   (Get-AudioDevice -list | Where-Object Name -Like ("$RecordingVR*") | Set-AudioDevice).Name
} Else {
   (Get-AudioDevice -list | Where-Object Name -Like ("$RecordingDesktop*") | Set-AudioDevice).Name
}