function main(fold)
	run(['../../individual_approaches/letter_e_raw/main(' int2str(fold) ')']);
	run(['../../individual_approaches/letter_e_median/main(' int2str(fold) ')']);
	run(['../../individual_approaches/letter_e_average/main(' int2str(fold) ')']);
	build_and_test(fold);
end
