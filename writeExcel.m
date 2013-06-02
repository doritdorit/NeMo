function [ output_args ] = writeExcel(savefolder, atlas, matdatafile)
%WRITEEXCEL Summary of this function goes here
%   Detailed explanation goes here
    matdata = load(matdatafile);
    regionfile = [savefolder filesep 'Regions' num2str(atlas) '.csv'];
    nConMatMetsfile = [savefolder filesep 'nConMatMetrics' num2str(atlas) '.csv'];
    ConMatMetsfile = [savefolder filesep 'ConMatMetrics' num2str(atlas) '.csv'];
    fclose(fopen(regionfile, 'w'));
    fclose(fopen(nConMatMetsfile, 'w'));
    fclose(fopen(ConMatMetsfile, 'w'));
    
    fprintf('Writing to file...');
    for i=1:length(matdata.ChaCoResults)
        id = matdata.ChaCoResults(i).NormPatID;
        region = matdata.ChaCoResults(i).Regions;
        conMat = matdata.ChaCoResults(i).ConMatMets;
        nConMat = matdata.ChaCoResults(i).nConMatMets;
        fileID = fopen(regionfile, 'at');
        fprintf(fileID, '%s,', id);
        fclose(fileID);
        fileID = fopen(nConMatMetsfile, 'at');
        fprintf(fileID, '%s,', id);
        fclose(fileID);
        fileID = fopen(ConMatMetsfile, 'at');
        fprintf(fileID, '%s,', id);
        fclose(fileID);
        dlmwrite(regionfile, region, '-append');
        dlmwrite(ConMatMetsfile, conMat, '-append');
        dlmwrite(nConMatMetsfile, nConMat, '-append');
    end
    fprintf('Writing done');
end

