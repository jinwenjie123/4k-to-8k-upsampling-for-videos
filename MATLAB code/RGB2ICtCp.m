function output_mat = RGB2ICtCp(input_mat, inverse, L_p)
% Helper function that converts a rgb image to ICtCp colorspace, if 
% inverse is false, then the conversion is rgb -> ICtCp, otherwise 
% the conversion is inversed

% Note: the implementation is based on the documentation from Dolby and 
% colour-science package in python with method='Dolby 2016'
% Reference: 
% [1] https://professional.dolby.com/siteassets/pdfs/dolby-vision-measuring-perceptual-color-volume-v7.1.pdf
% [2] https://github.com/colour-science/colour

    if nargin < 3
        L_p = 10000;
    end
    
    MATRIX_ICTCP_RGB_TO_LMS = [
        [1688, 2146, 262],
        [683, 2951, 462],
        [99, 309, 3688]] / 4096;

    MATRIX_ICTCP_ICTCP_TO_LMS_P = [
        [1.0,  0.00860904,  0.1110296], 
        [1.0, -0.00860904, -0.11102963], 
        [1.0,  0.56003134, -0.32062717]];

    MATRIX_ICTCP_LMS_TO_RGB = [
        [3.43660669, -2.50645212,  0.06984542], 
        [-0.79132956,  1.98360045, -0.1922709], 
        [-0.0259499 , -0.09891371,  1.12486361]];

    MATRIX_ICTCP_LMS_P_TO_ICTCP = [
        [2048, 2048, 0],
        [6610, -13613, 7003],
        [17933, -17390, -543]] / 4096;
    
    if inverse == false
        LMS = vector_dot(MATRIX_ICTCP_RGB_TO_LMS, input_mat);
        LMS_p = eotf_inverse_ST2084(LMS, L_p);
        
        output_mat =  vector_dot(MATRIX_ICTCP_LMS_P_TO_ICTCP, LMS_p);

    else
        LMS_p = vector_dot(MATRIX_ICTCP_ICTCP_TO_LMS_P, input_mat);
        LMS = eotf_ST2084(LMS_p, L_p);

        output_mat =  vector_dot(MATRIX_ICTCP_LMS_TO_RGB, LMS);
    end

end


function ImgOut = vector_dot(M_CAT, ImgIn)
% Helper function following the same procedures in colour-science package
% in python, shown here:
% https://colour.readthedocs.io/en/develop/_modules/colour/algebra/common.html#vector_dot

% Note that we actually used the same functions in RGB2XYZ matlab function
    
    ImgOut = reshape((M_CAT * reshape(ImgIn, size(ImgIn, 1) * size(ImgIn, 2), ...
        size(ImgIn, 3))')', size(ImgIn, 1), size(ImgIn, 2), size(ImgIn, 3));

end

function o = spow(a, p)
% Helper function that does sign power
% https://colour.readthedocs.io/en/latest/_modules/colour/algebra/common.html
    
    o = sign(a) .* abs(a) .^ p;

end

function N = eotf_inverse_ST2084(C, L_p)
% Helper function that does the following:
% https://colour.readthedocs.io/en/develop/_modules/colour/models/rgb/transfer_functions/st_2084.html#eotf_inverse_ST2084

    m_1 = 2610 / 4096 * (1 / 4);
    m_2 = 2523 / 4096 * 128;
    c_1 = 3424 / 4096;
    c_2 = 2413 / 4096 * 32;
    c_3 = 2392 / 4096 * 32;

    Y_p = spow(C / L_p, m_1);
    N = spow((c_1 + c_2 * Y_p) ./ (c_3 * Y_p + 1), m_2);

end

function C = eotf_ST2084(N, L_p)
% Helper function that does the following:
% https://colour.readthedocs.io/en/develop/_modules/colour/models/rgb/transfer_functions/st_2084.html#eotf_ST2084
    
    m_1 = 2610 / 4096 * (1 / 4);
    m_2 = 2523 / 4096 * 128;
    c_1 = 3424 / 4096;
    c_2 = 2413 / 4096 * 32;
    c_3 = 2392 / 4096 * 32;
    
    m_1_d = 1 / m_1;
    m_2_d = 1 / m_2;

    V_p = spow(N, m_2_d);

    n = V_p - c_1;
    n = max(n, 0); % matlab trick to convert all negative elements to 0

    L = spow((n ./ (c_2 - c_3 * V_p)), m_1_d);
    C = L_p * L;

end

