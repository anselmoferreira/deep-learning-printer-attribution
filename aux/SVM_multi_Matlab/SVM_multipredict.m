function [AttribClasses, BinClassResultMat] = SVM_multipredict (ClassifierModels, TestVec, nprts)

nclsf = nchoosek (nprts, 2);
[nv_tst, ~] = size(TestVec);

% Test Results of Binary Classifiers
BinClassResultMat  = zeros(nv_tst, nclsf);

% Test for each classifier
i = 0;
for prt1 = 1 : (nprts - 1);
    
    for prt2 = (prt1 + 1) : nprts;
        i = i + 1;
        
	%solve memory problems
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	numExemplars = size(TestVec,1);
        chunkSize = 1000;
	k=1:chunkSize:numExemplars;
	TestAttribBin = zeros(numExemplars,1);  %initialize
	for l=1:length(k)-1;
    		index1 = k(l);
    		index2 = k(l+1)-1;
    		fprintf('classifying exemplars %d to %d\n', index1, index2 );
    		chunk = TestVec(index1:index2,:);
    		TestAttribBin(index1:index2) = svmclassify(ClassifierModels(i),chunk);
	end
	
	%last bit of data
	chunk = TestVec(k(end):numExemplars,:);
	TestAttribBin(k(end):numExemplars) = svmclassify(ClassifierModels(i),chunk);
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % SVM Test classification - results
        BinClassResultMat (TestAttribBin ==  1  , i) = prt1;
        BinClassResultMat (TestAttribBin ==  -1 , i) = prt2;
        
        clearvars TestAttribBin
               
    end
    
end




% Attributed Classes
AttribClasses = mode(BinClassResultMat, 2);

end
