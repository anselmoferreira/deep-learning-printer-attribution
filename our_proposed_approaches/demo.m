function demo()

	%run('where_your_matconvnet_library_is/matlab/vl_setupnn.m') ;
	run('/home/anselmo/matconvnet-1.0-beta23/matlab/vl_setupnn.m');
	
	disp('Welcome to the source code of our TIFS paper.');	
	disp('We will run 6 lightweight networks here applied on different representations (raw, median residual and average residual) of different data (letters E and letters A. Then, we will do two early fusions, one in each letter and then a late fusion of the early fusions results.');
	disp('Press Enter to Continue...');
	pause;
	disp('Each individual code does the following:');
	disp('For each combination of training and testing in our 5x2 validation procedure');
	disp('1. Generate Data in IMDB format (.mat files)');
	disp('2. Train network using training data (letters E or letters A from documents)');
	disp('3. Use the trained network as feature extractor for both training and testing images');
	disp('4. Train and test feature vectors from documents letters in an SVM one-against-one classifier using 10 known printer classes');
	disp('5. The source printer predicted by the classifier will be decided after majority voting of documents letters classification');
	disp('Here we have an example using just fold=1. You can do a for loop iterating from fold=1 to fold=10 and then you can get our total results on accuracies.txt in the late_fusion folder');
	disp('Dont forget to cite our paper Data Driven Approaches for Laser Printer Attribution if you use this code in our research. Details can be found in the Readme.MD file in the GitHub repository');
	disp('Press ENTER if you want to begin running the code');
	pause;
	disp('SHOWTIME!!!!!');
	disp('...........................................________') 
	disp('....................................,.-‘”...................``~.,') 
	disp('.............................,.-”...................................“-.,') 
	disp('.........................,/...............................................”:,') 
	disp('.....................,?......................................................\,') 
	disp('.................../...........................................................,}') 
	disp('................./......................................................,:`^`..}') 
	disp('.............../...................................................,:”........./') 
	disp('..............?.....__.........................................:`.........../') 
	disp('............./__.(.....“~-,_..............................,:`........../') 
	disp('.........../(_....”~,_........“~,_....................,:`........_/') 
	disp('..........{.._$;_......”=,_.......“-,_.......,.-~-,},.~”;/....}') 
	disp('...........((.....*~_.......”=-._......“;,,./`..../”............../') 
	disp('...,,,___.\`~,......“~.,....................`.....}............../') 
	disp('............(....`=-,,.......`........................(......;_,,-”') 
	disp('............/.`~,......`-...............................\....../\') 
	disp('.............\`~.*-,.....................................|,./.....\,__') 
	disp(',,_..........}.>-._\...................................|..............`=~-,') 
	disp('.....`=~-,_\_......`\,.................................\') 
	disp('...................`=~-,,.\,...............................\') 
	disp('................................`:,,...........................`\..............__') 
	disp('.....................................`=-,...................,%`>--==``') 
	disp('........................................_\..........._,-%.......`\') 
	disp('...................................,')
	disp('PLEASE WAIT THE CODE FINISHING! IT WILL TAKE A LOT OF TIME!');
	%clean data of previous executions
	disp('Cleaning previous data...');
	clean_data();
	%here we have an example using just fold=1. You can do a for loop iterating from fold=1 to fold=10 and then you can get our total 	results on accuracies.txt in the late_fusion folder
	fold=1;
	disp('STARTING ANALYSIS ON LETTER E...');
	run(['early_fusion/letter_e/main(' int2str(fold) ')']);
	%sendmail2me('Letter E individual and early fusion finished');
	disp('STARTING ANALYSIS ON LETTER A...');
        run(['early_fusion/letter_a/main(' int2str(fold) ')']);
	%sendmail2me('Letter A individual and early fusion finished');
	disp('STARTING LATE FUSION ON LETTERS E and A.');
        run(['late_fusion/late_fusion(' int2str(fold) ')']);
	
end
