####################################################################
#/ Nom du projet: pwsh-menu                                       /#
#/ Nom du fichier: menu.ps1                                       /#
#/ Type de fichier: fichier principal                             /#
#/ Fichier annexe:                                                /#
#/                                                                /#
#/ Auteur: ZephyrOff  (Alexandre Pajak)                           /#
#/ Version: 1.0                                                   /#
#/ Description: Générateur de menu à touches fléchées             /#
#/ Date: 27/04/2022                                               /#
####################################################################

Function Menu (){
    Param(
        [Parameter(Mandatory=$True)][String]$Title,
        [Parameter(Mandatory=$True)][array]$Options,
        [Parameter(Mandatory=$False)][string]$Background = "Black",
        [Parameter(Mandatory=$False)][string]$Foreground = "Yellow",
        [Parameter(Mandatory=$False)][string]$Pointer = ">"
        [Parameter(Mandatory=$False)][string]$Padding = 2
    )

    $MenuMax = $Options.count-1
    $Selected = 0

    [Console]::CursorVisible = $false

    $cursor = $host.UI.RawUI.CursorPosition

    Write-Host "$Title"

    While($True){
        For ($i=0; $i -le $MenuMax; $i++){
            [Console]::SetCursorPosition(0 , $i + $cursor.Y + $Padding)

            If ($i -eq $Selected){
                Write-Host -BackgroundColor $Background -ForegroundColor $Foreground "$Pointer $($Options[$i])"
            }Else{
                Write-Host "  $($Options[$i])  "
            }
        }

        Switch($host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode){
            13{ #enter key
                Return $Selected
            }

            38{ #down key
                If ($Selected -eq 0){
                    $Selected = $MenuMax
                }Else{
                    $Selected -= 1
                }
                break
            }

            40{ #up key
                If ($Selected -eq $MenuMax){
                    $Selected = 0
                }Else{
                    $Selected +=1
                }
                break
            }
        }
    }
}