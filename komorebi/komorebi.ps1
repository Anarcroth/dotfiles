if (!(Get-Process whkd -ErrorAction SilentlyContinue))
{
    Start-Process whkd -WindowStyle hidden
}

. $PSScriptRoot\komorebi.generated.ps1

# Send the ALT key whenever changing focus to force focus changes
komorebic alt-focus-hack enable
# Default to cloaking windows when switching workspaces
komorebic window-hiding-behaviour cloak
# Set cross-monitor move behaviour to insert instead of swap
komorebic cross-monitor-move-behaviour insert
# Enable hot reloading of changes to this file
komorebic watch-configuration enable

# Create named workspaces I-V on monitor 0
komorebic ensure-named-workspaces 0 I II III IV V VI
# You can do the same thing for secondary monitors too
komorebic ensure-named-workspaces 1 A B C D E F

# Assign layouts to workspaces, possible values: bsp, columns, rows, vertical-stack, horizontal-stack, ultrawide-vertical-stack
komorebic named-workspace-layout I columns
komorebic named-workspace-layout II columns
komorebic named-workspace-layout III columns
komorebic named-workspace-layout IV columns
komorebic named-workspace-layout V columns
komorebic named-workspace-layout VI columns

komorebic named-workspace-layout A columns
komorebic named-workspace-layout B columns
komorebic named-workspace-layout C columns
komorebic named-workspace-layout D columns
komorebic named-workspace-layout E columns
komorebic named-workspace-layout F columns

# Set the gaps around the edge of the screen for a workspace
komorebic named-workspace-padding I 10
komorebic named-workspace-padding II 10
komorebic named-workspace-padding III 10
komorebic named-workspace-padding IV 10
komorebic named-workspace-padding V 10
# Set the gaps between the containers for a workspace
komorebic named-workspace-container-padding I 8
komorebic named-workspace-container-padding II 8
komorebic named-workspace-container-padding III 8
komorebic named-workspace-container-padding IV 8
komorebic named-workspace-container-padding V 8

# You can assign specific apps to named workspaces
# komorebic named-workspace-rule exe "Firefox.exe" III

# Configure the invisible border dimensions
# komorebic invisible-borders 2 2 2 2

# Uncomment the next lines if you want a visual border around the active window
komorebic active-window-border-width 8
komorebic active-window-border-colour 82 139 255 --window-kind single
komorebic active-window-border-colour 192 120 221 --window-kind stack
komorebic active-window-border-colour 255 51 153 --window-kind monocle
komorebic active-window-border enable

komorebic complete-configuration
