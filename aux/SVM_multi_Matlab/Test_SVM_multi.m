function [PrtsAttrib, BinClassResultMat] = Test_SVM_multi(Models,test_file)  

	TestV = csvread(test_file);
	[PrtsAttrib, BinClassResultMat] = SVM_multipredict (Models, TestV(:, 2:end), 10);

end
