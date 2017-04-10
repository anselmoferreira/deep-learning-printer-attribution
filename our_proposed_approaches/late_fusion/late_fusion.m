function late_fusion(fold)
		
		num_char_per_document_test_e=dlmread(['../individual_approaches/letter_e_raw/Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-num-char-per-document.txt']); 
		num_char_per_document_test_a=dlmread(['../individual_approaches/letter_a_raw/Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-num-char-per-document.txt']); 
		ground_truth_document_test=dlmread(['../individual_approaches/letter_e_raw/Data/Fold-' num2str(fold)  '/Fold-' num2str(fold) '-groundtruth-documents.txt']);

                votes_letters_e=dlmread(['../early_fusion/letter_e/Data/Fold-' int2str(fold) '/output_letters.txt']);
                votes_letters_a=dlmread(['../early_fusion/letter_a/Data/Fold-' int2str(fold) '/output_letters.txt']);

		index_e=1;
		index_a=1;
                
		for j=1:size(num_char_per_document_test_a,2)
			judges=horzcat(votes_letters_e(index_e:index_e+num_char_per_document_test_e(j)-1)',votes_letters_a(index_a:index_a+num_char_per_document_test_a(j)-1)');
			classes_final(j)=mode(judges);
		        index_a=index_a+num_char_per_document_test_a(j);
			index_e=index_e+num_char_per_document_test_e(j);
		end

		accuracy_documents=write_confusion_matrix(classes_final, ground_truth_document_test, ['fold' int2str(fold) '-confusion-matrix.csv']);
		disp(['Accuracy for fold ' num2str(fold) ' is ' num2str(accuracy_documents)]);
		dlmwrite('Accuracies.txt', accuracy_documents, '-append');
		%sendmail2me(['Multiple Representation of Multiple Data CNN approach for laser printer attribution for fold ' int2str(fold) ' finished. Accuracy:' num2str(accuracy_documents)]);		
end
