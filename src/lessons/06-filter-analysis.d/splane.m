function splane(z, p)
    plot(real(z), imag(z), 'o', real(p), imag(p), 'x');
    title('Pole-Zero Plot');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis('equal');
    line([0, 0], ylim(), 'LineStyle', ':');
    line(xlim(), [0, 0], 'LineStyle', ':');
end
