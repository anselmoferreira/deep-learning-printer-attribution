function build_and_test(fold)
    
	mkdir(['Data/Fold-' num2str(fold)]);
	disp('Creating train feature vectors...');
    	train_feature_vectors_1st=dlmread(['../../individual_approaches/letter_a_raw/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-train.txt']);
    	train_feature_vectors_2nd=dlmread(['../../individual_approaches/letter_a_median/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-train.txt']);
    	train_feature_vectors_3rd=dlmread(['../../individual_approaches/letter_a_average/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-train.txt']);
    	train_final=horzcat(train_feature_vectors_1st,train_feature_vectors_2nd(:,2:end), train_feature_vectors_3rd(:,2:end));
	dlmwrite(['Data/Fold-' num2str(fold) '/Fold-' num2str(fold) '-train.txt'], train_final);
    
    	disp('Creating test feature vectors...');
    	test_feature_vectors_1st=dlmread(['../../individual_approaches/letter_a_raw/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-test.txt']);
    	test_feature_vectors_2nd=dlmread(['../../individual_approaches/letter_a_median/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-test.txt']);

	test_feature_vectors_3rd=dlmread(['../../individual_approaches/letter_a_average/Data/Fold-' int2str(fold) '/Fold-' int2str(fold) '-test.txt']);
    	test_final=horzcat(test_feature_vectors_1st,test_feature_vectors_2nd(:,2:end), test_feature_vectors_3rd(:,2:end));
    	
	dlmwrite(['Data/Fold-' num2str(fold) '/Fold-' num2str(fold) '-test.txt'], test_final);

    	accuracy_documents=classify(fold, ['Data/Fold-' num2str(fold) '/Fold-' num2str(fold) '-train.txt'], ['Data/Fold-' num2str(fold) '/Fold-' num2str(fold) '-test.txt'], ['../../individual_approaches/letter_a_raw/Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-num-char-per-document.txt'], ['../../individual_approaches/letter_a_raw/Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-groundtruth-documents.txt']);


	disp(['Accuracy for fold ' num2str(fold) ' is ' num2str(accuracy_documents)]);
    
end
