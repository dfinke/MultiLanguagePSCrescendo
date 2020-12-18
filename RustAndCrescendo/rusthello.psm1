# Module created by Microsoft.PowerShell.Crescendo
Function Get-HelloRust
{
[CmdletBinding()]

param(
[Parameter(Position=0)]
[string]$Name,
[Parameter(Position=1)]
[string]$Age
    )

BEGIN {
    $__PARAMETERMAP = @{
        Name = @{ OriginalName = ''; OriginalPosition = '0'; Position = '0'; ParameterType = [string]; NoGap = $False }
        Age = @{ OriginalName = ''; OriginalPosition = '1'; Position = '1'; ParameterType = [string]; NoGap = $False }
    }

    $__outputHandlers = @{
        Default = @{ StreamOutput = $True; Handler = { 
            $h = [ordered]@{}
            foreach($item in $input) {
                $k,$v = $item -split '='
                $h.($k.trim())=$v.trim()
            }
            [pscustomobject]$h
             } }
    }
}
PROCESS {
    $__commandArgs = @()
    $__boundparms = $PSBoundParameters
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name]}).ForEach({$PSBoundParameters[$_.Name] = [switch]::new($false)})
    if ($PSBoundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $PSBoundParameters.Keys|Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $PSBoundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ( $value -is [switch] ) { $__commandArgs += $value.IsPresent ? $param.OriginalName : $param.DefaultMissingValue }
            elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
            else { $__commandArgs += $param.OriginalName; $__commandArgs += $value |Foreach-Object {$_}}
        }
    }
    $__commandArgs = $__commandArgs|Where-Object {$_}
    if ($PSBoundParameters["Debug"]){wait-debugger}
    if ( $PSBoundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message $PSScriptRoot/hello.exe
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("$PSScriptRoot/hello.exe")) {
        if ( $__handlerInfo.StreamOutput ) {
            & "$PSScriptRoot/hello.exe" $__commandArgs | & $__handler
        }
        else {
            $result = & "$PSScriptRoot/hello.exe" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#
.SYNOPSIS
Could not find $PSScriptRoot/hello.exe to generate help.

.DESCRIPTION See help for $PSScriptRoot/hello.exe

.PARAMETER Name
Just a string


.PARAMETER Age
Just a number



#>
}

Export-ModuleMember -Function Get-HelloRust
