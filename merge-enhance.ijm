#@ String (visibility=MESSAGE, value="Name keyword from the channels to merge:", required=false) msg1

#@ String (label="Channel 1", description="Name field") Channel1_keyword
#@ String (label=" ", choices={"Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Cyan") Color1

#@ String (label="Channel 2", description="Name field", value=DAPI) Channel2_keyword
#@ String (label=" ", choices={"Cyan", "Green", "Red", "Magenta", "Grays"}, style="radioButtonHorizontal", value="Magenta") Color2

#@ String (visibility=MESSAGE, value="Select values", required=false) msg2
#@ Integer (label="Channel 1 min", style="slider", min=0, max=255, stepSize=1) min1
#@ Integer (label="Channel 1 max", style="slider", min=0, max=255, stepSize=1) max1
#@ Integer (label="Channel 2 min", style="slider", min=0, max=255, stepSize=1) min2
#@ Integer (label="Channel 2 max", style="slider", min=0, max=255, stepSize=1) max2

#@ String (label="save the results?", choices={"Yes", "No"}, style="radioButtonHorizontal") save_results

Channel1 = Channel1_keyword;
Channel2 = Channel2_keyword;
list = getList("image.titles");
if (list.length==0)
 print("No image windows are open");
else {
 for (i=0; i<list.length; i++){
 	if (list[i].contains(Channel1_keyword)){
 		Channel1 = list[i];
 	}
 	if (list[i].contains(Channel2_keyword)){
 		Channel2 = list[i];
 	}
 }
}

selectWindow(Channel1);
run(Color1);
setMinAndMax(min1, max1);
selectWindow(Channel2);
run(Color2);
setMinAndMax(min2, max2);
	


run("Merge Channels...", "c2=&Channel1 c6=&Channel2 create keep");
run("Scale Bar...", "width=20 height=24 thickness=4 font=40 color=White background=None location=[Lower Right] horizontal bold overlay");
rename("Enhanced-" + Channel1_keyword + "_y_" + Channel2);

/*
selectWindow(Channel1);
run("Brightness/Contrast...");
resetMinAndMax();
selectWindow(Channel2);
run("Brightness/Contrast...");
resetMinAndMax();
*/

	
if (save_results=="Yes"){
	saveAs("Jpeg...");
	}
