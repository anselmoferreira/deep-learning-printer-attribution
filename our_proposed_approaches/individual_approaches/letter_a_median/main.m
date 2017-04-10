function main(fold)

	opts.expDir = fullfile('Data','Network-Training-Data') ;
	mkdir(opts.expDir);

	opts.useBnorm = false ;
	opts.train.batchSize = 100 ;
	opts.train.numEpochs = 20;
	opts.train.continue = true ;
	%if you have GPUs, put their indeces here
	opts.train.gpus = [1] ;
	opts.train.learningRate = 0.001 ;
	opts.train.expDir = opts.expDir ;

  	%The first step is generating an imdb file containing the data used for the experiments using matconvnet
    	%and also information to be used in the majority voting scheme (char_per_document_test) and finally
    	%the groundtruth of each document to be used in the accuracy metric used later
	disp('1. Generate Data in IMDB format (.mat files)');
	[imdb, ground_truth_documents_test, char_per_document_test]=generate_imdb(opts,fold,'median');

	disp('2. Train network using training data (letters E from documents)');
    	%With imdb file ready, it is time to train the network
    	[net, info] = train_network(opts,fold,imdb);

	disp('3. Use the trained network as feature extractor for both training and testing images');
    	%Now we will use the network as feature extractor, for both training and testing images in the imdb
    	[classes_train,features_train,classes_test,features_test]=features_vector_generator(imdb,net,fold);

	%time to save everything 
    	mkdir(['Data/Fold-' num2str(fold)]);
	save(['Data/Fold-' num2str(fold) '/imdb-median-images-fold-' int2str(fold) '.mat'], '-struct', 'imdb');
	dlmwrite(['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-groundtruth-documents.txt'], ground_truth_documents_test);
    	dlmwrite(['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-num-char-per-document.txt'], char_per_document_test);
	dlmwrite(['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-train.txt'], horzcat(classes_train,features_train(2:end,:)));
	dlmwrite(['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-test.txt'], horzcat(classes_test,features_test(2:end,:)));


	%Then, we classify the feature vectors using an one-against one classifier
	disp('4. Train and test feature vectors from documents letters in an SVM one-against-one classifier using 10 known printer classes');
	accuracy_documents=classify(fold, ['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-train.txt'], ['Data/Fold-' num2str(fold)  '/Fold-' 		num2str(fold) '-test.txt'], ['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-num-char-per-document.txt'], ['Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-groundtruth-documents.txt']);    
	disp(['Accuracy for fold ' num2str(fold) ' is ' num2str(accuracy_documents)]);
	dlmwrite('Accuracies.txt', accuracy_documents, '-append');
	%clean network data for the next experiment
	system('rm -rf Data/Network-Training-Data/*');
end

%[mean, fmeasures, precisions, recalls] = calculate_statistics();
%Disp(['Mean accuracy for network applied on median letters E is: ' num2str(mean)]);
