function accuracy_documents=classify(fold, train_file, test_file, num_char_per_document_test, ground_truth_document_test)

	addpath('../../aux/SVM_multi_Matlab');
	disp('--- Training ---');

	TrainV = csvread(train_file);   
	Models = SVM_multitrain (TrainV(:, 2:end), TrainV(:, 1), 10);

	disp('--- Testing ---');
	PrtsAttrib = Test_SVM_multi(Models, test_file);  
	dlmwrite(['Data/Fold-' num2str(fold) '/output_letters.txt'], PrtsAttrib);

	TestV = csvread(train_file);
	num_char_per_document_test=dlmread(num_char_per_document_test);
	ground_truth_document_test=dlmread(ground_truth_document_test);

	disp('5. The source printer predicted by the classifier will be decided after majority voting of documents letters classification');    
	classes_final=voting(PrtsAttrib,num_char_per_document_test);
        	
	disp(['Writing confusion matrix for fold ' int2str(fold)]);
	accuracy_documents=write_confusion_matrix(classes_final, ground_truth_document_test, ['Data/Fold-' int2str(fold) '/fold' int2str(fold) '-confusion-matrix.csv']);

	dlmwrite('accuracies.txt', accuracy_documents, '-append');
end
