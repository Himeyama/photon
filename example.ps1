Add-Type -AssemblyName PresentationFramework

$auto = New-Object System.Windows.GridLength(1, [System.Windows.GridUnitType]::Auto)
$star1 = New-Object System.Windows.GridLength(1, [System.Windows.GridUnitType]::Star)
$star2 = New-Object System.Windows.GridLength(2, [System.Windows.GridUnitType]::Star)

function Add-SecondaryButton($parent, $content, $margin){
    $button = New-Object System.Windows.Controls.Button
    $button.Content = $content
    $button.Margin = $margin
    $button.Style = $window.FindResource("SecondaryButton")
    if($null -ne $parent){
        $parent.AddChild($button)
    }
    return $button
}

function Add-PrimaryButton($parent, $content, $margin){
    $button = New-Object System.Windows.Controls.Button
    $button.Content = $content
    $button.Margin = $margin
    $button.Style = $window.FindResource("PrimaryButton")
    if($null -ne $parent){
        $parent.AddChild($button)
    }
    return $button
}

function Add-TextBlock($parent, $txt, $margin){
    $text = New-Object System.Windows.Controls.TextBlock
    $text.Text = $txt
    $text.FontSize = "16"
    $text.Margin = $margin
    if($null -ne $parent){
        $parent.AddChild($text)
    }
    return $text
}

function Add-RowGrid($parent, $gridLengths, $controls){
    $grid = New-Object System.Windows.Controls.Grid
    for($i = 0; $i -lt $gridLengths.Count; $i++){
        $row = New-Object System.Windows.Controls.RowDefinition
        $grid.RowDefinitions.Add($row)
        $row.Height = $gridLengths[$i]
        [System.Windows.Controls.Grid]::SetRow($controls[$i], $i)
        $grid.Children.Add($controls[$i])
    }
    if($null -ne $parent){
        $parent.AddChild($grid)
    }
    return $grid
}

function Add-ColumnGrid($parent, $gridLengths, $controls){
    $grid = New-Object System.Windows.Controls.Grid
    for($i = 0; $i -lt $gridLengths.Count; $i++){
        $column = New-Object System.Windows.Controls.ColumnDefinition
        $grid.ColumnDefinitions.Add($column)
        $column.Width = $gridLengths[$i]
        [System.Windows.Controls.Grid]::SetColumn($controls[$i], $i)
        $grid.Children.Add($controls[$i])
    }
    if($null -ne $parent){
        $parent.AddChild($grid)
    }
    return $grid
}

[xml]$xaml = Get-Content ".\photon.xaml"
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)
$window.Title = "Photon"
$window.Height = "200"
$window.Width = "300"
$mainPanel = $window.FindName("MainPanel")

$primaryButton = Add-PrimaryButton $mainPanel "Primary Button" "8, 8, 8, 8"
$secondaryButton = Add-SecondaryButton $mainPanel "Secondary Button" "8, 8, 8, 8"

# クリックしたとき
$primaryButton.Add_Click({
    $result = [System.Windows.MessageBox]::Show("Hello, World", "Title", [System.Windows.MessageBoxButton]::OKCancel, [System.Windows.MessageBoxImage]::Information)
    if($result -eq $a -eq [System.Windows.MessageBoxResult]::OK){
        Write-Host "OK" -ForegroundColor Green
    }
})

$text1 = Add-TextBlock $null "左のラベル" "8, 8, 8, 8"
$text2 = Add-TextBlock $null "右のラベル" "8, 8, 8, 8"
$grid = Add-ColumnGrid $mainPanel @($star1, $star1) @($text1, $text2)

$window.ShowDialog() | Out-Null

# Add-Type -AssemblyName PresentationFramework

