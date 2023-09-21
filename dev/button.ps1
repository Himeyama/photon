$fontSizeProperty = [System.Windows.Controls.Control]::FontSizeProperty
$backgroundProperty = [System.Windows.Controls.Control]::BackgroundProperty
$foregroundProperty = [System.Windows.Controls.Control]::ForegroundProperty
$horizontalContentAlignmentProperty = [System.Windows.Controls.Control]::HorizontalContentAlignmentProperty
$verticalContentAlignmentProperty = [System.Windows.Controls.Control]::VerticalContentAlignmentProperty
$paddingProperty = [System.Windows.Controls.Control]::PaddingProperty
$fontFamilyProperty = [System.Windows.Controls.Control]::FontfamilyProperty
$borderTicknessProperty = [System.Windows.Controls.Control]::BorderThicknessProperty
$templateProperty = [System.Windows.Controls.Control]::TemplateProperty

$primeButtonStyle = New-Object System.Windows.Style
$primeButtonStyle.TargetType = [System.Windows.Controls.Button]

$setter = New-Object System.Windows.Setter
$setter.Property = $backgroundProperty
$setter.Value = New-Object System.Windows.Media.SolidColorBrush
$setter.Value.Color = [System.Windows.Media.Color]::FromArgb(0xFF, 0x0F, 0x6C, 0xBD)
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $foregroundProperty
$setter.Value = New-Object System.Windows.Media.SolidColorBrush
$setter.Value.Color = [System.Windows.Media.Color]::FromArgb(0xFF, 0xFF, 0xFF, 0xFF)
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $horizontalContentAlignmentProperty
$setter.Value = [System.Windows.HorizontalAlignment]::Center
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $verticalContentAlignmentProperty
$setter.Value = [System.Windows.VerticalAlignment]::Center
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $paddingProperty
$setter.Value = New-Object System.Windows.Thickness(16, 6, 16, 6)
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $fontSizeProperty
$setter.Value = 14
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $fontFamilyProperty
$setter.Value = [System.Windows.Media.FontFamily]::new("Meiryo")
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $borderTicknessProperty
$setter.Value = [System.Windows.Thickness]::new(16, 6, 16, 6)
$primeButtonStyle.Setters.Add($setter)

$setter = New-Object System.Windows.Setter
$setter.Property = $templateProperty
$setter.Value = [System.Windows.Controls.ControlTemplate]::new()
$primeButtonStyle.Setters.Add($setter)

$primeButtonStyle.Setters