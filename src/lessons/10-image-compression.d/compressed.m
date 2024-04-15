B_abs_sort = sort(B_abs(:));

for drop = [0.0000, 0.9000, 0.9900, 0.9950, 0.9975, 0.9990]
    threshold = B_abs_sort(floor(numel(B_abs_sort) * drop) + 1);
    mask = B_abs >= threshold;

    compressed = uint8(ifft2(ifftshift(B_fft .* mask)));
    imwrite(compressed, sprintf('%1.4f.jpg', drop));
end
