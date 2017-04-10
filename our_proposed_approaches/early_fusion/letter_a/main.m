function main(fold)
	run(['../../individual_approaches/letter_a_raw/main(' int2str(fold) ')']);
	run(['../../individual_approaches/letter_a_median/main(' int2str(fold) ')']);
	run(['../../individual_approaches/letter_a_average/main(' int2str(fold) ')']);
	build_and_test(fold);
end
