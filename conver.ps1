# Script para convertir todos los iconos PNG en src-tauri/icons a RGBA
# Usa ImageMagick 7+ (requiere que 'magick' esté en el PATH)

$iconsPath = "src-tauri/icons"

if (!(Test-Path $iconsPath)) {
    Write-Host "❌ No se encontró la carpeta $iconsPath"
    exit 1
}

Write-Host "🔄 Convirtiendo iconos en $iconsPath a formato RGBA..."

# Procesar cada archivo PNG
Get-ChildItem -Path $iconsPath -Filter *.png | ForEach-Object {
    $file = $_.FullName
    Write-Host "  → Procesando $file"
    magick "$file" -define png:color-type=6 "$file"
}

Write-Host "✅ Todos los iconos fueron convertidos correctamente a RGBA."
