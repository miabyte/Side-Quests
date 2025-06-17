// Enable the following line to suppress the "Save As" dialog
// app.displayDialogs = DialogModes.NO;

var psdFile = app.activeDocument;
var psdPath = psdFile.path;
var psdName = psdFile.name.slice(0, -4); // Remove the ".psd" extension

// Save as PNG
var pngOptions = new PNGSaveOptions();
psdFile.saveAs(new File(psdPath + "/" + psdName + ".png"), pngOptions, true);

// Save as JPG
var jpgOptions = new JPEGSaveOptions();
jpgOptions.quality = 12; // Set JPG quality (0-12, higher value means better quality)
psdFile.saveAs(new File(psdPath + "/" + psdName + ".jpg"), jpgOptions, true);
