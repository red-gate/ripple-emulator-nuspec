param($installPath, $toolsPath, $package, $project)

function Set-ItemToEmbeddedResource($simpleItem) {
    $simpleItem.Properties.Item("BuildAction").Value = [int]3
}
    
function Set-ItemAndDescendentsToEmbeddedResource($item) {
    $items = $item.ProjectItems
    
    foreach ($childItem in $items) {
        if ($childItem.Kind -eq "{6BB5F8EF-4483-11D3-8BCF-00C04F8EC28C}") {
            Set-ItemAndDescendentsToEmbeddedResource($childItem)
        } else {
            Set-ItemToEmbeddedResource($childItem)
        }
    }
}

$rippleVsFolder = $project.ProjectItems.Item("Ripple");

Set-ItemAndDescendentsToEmbeddedResource($rippleVsFolder)








