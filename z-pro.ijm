#@ File (label="Select a file", style="open") openedFile
/*La linea de arriba ejecuta el selector de archivo y guarda la ruta
al archivo en la variable opendedFile*/
open(openedFile); //abrir el archivo seleccionado
currentFile = File.getName(openedFile); //guarda el nombre del archivo
currentFile = toString(currentFile); //conveirte el nombre del archivo en cadena

//se pregunta al usuario como quiere nombrar sus canales
#@ String (visibility=MESSAGE, value="Name each channel:", required=false) msg1

#@ String (label="1st channel name:", description="Name field", value=DAPI) Channel1
#@ String (label=" ", choices={"Blue", "Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Cyan") Color1

#@ String (label="2nd channel name:", description="Name field") Channel2
#@ String (label=" ", choices={"Blue", "Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Green") Color2


#@ String (label="3rd channel name:", description="Name field") Channel3
#@ String (label=" ", choices={"Blue", "Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Magenta") Color3

#@ String (label="4th channel name:", description="Name field", value=Tuj1) Channel4
#@ String (label=" ", choices={"Blue", "Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Grays") Color4

#@ String (visibility=MESSAGE, value="", required=false) msg2
#@ String (label="save the results?", choices={"Yes", "No"}, style="radioButtonHorizontal") save_results

#@ String (visibility=MESSAGE, value="", required=false) msg3
#@ String (label="Choose a format", choices={"Jpeg", "Tiff", "PNG"}, style="radioButtonHorizontal") chosen_format


run("Z Project...", "projection=[Max Intensity]");//ejecuta proyeccion en Z
title = getTitle();
getDimensions(width, height, channels, slices, frames);
CChannels=newArray("C1-","C2-","C3-","C4-");
Colors=newArray(Color1, Color2, Color3, Color4);
NewName=newArray(Channel1,Channel2, Channel3, Channel4);
run("Split Channels");//separa en canales
close(currentFile);//cerrra la imagen original
ChannelsToMerge = "";
for (c = channels-1; c >= 0; c--) { // Itera una cuenta regresiva según el número de canales. Se usa channels - 1 
	selectWindow(CChannels[c]+title);
	NewName[-c+channels-1] = NewName[-c+channels-1] + "-" + title;
	rename(NewName[-c+channels-1]);
	run(Colors[-c+channels-1]);
    ChannelsToMerge = ChannelsToMerge+" c"+c+1+"=["+NewName[-c+channels-1]+"]";
    }

run("Merge Channels...", ChannelsToMerge+" create keep");
run("Scale Bar...", "width=20 height=24 thickness=4 font=40 color=White background=None location=[Lower Right] horizontal bold overlay");
selectWindow("Composite");
rename("Merge-MAX_" + currentFile);


if (save_results=="Yes"){
saveAs(chosen_format + "...");
for (c = channels-1; c >= 0; c--) { // Itera una cuenta regresiva según el número de canales. Se usa channels - 1 
		selectWindow(NewName[-c+channels-1]);
		saveAs(chosen_format + "...");
    }
}
