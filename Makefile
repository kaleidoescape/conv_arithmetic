conv_arithmetic.pdf : export BSTINPUTS=$BSTINPUTS:./natbib
conv_arithmetic.pdf : conv_arithmetic.tex
	pdflatex conv_arithmetic
	pdflatex conv_arithmetic
	bibtex conv_arithmetic
	pdflatex conv_arithmetic
	pdflatex conv_arithmetic

.PHONY : clean
clean : 
	rm -f conv_arithmetic.{aux,bbl,blg,log}

.PHONY : all_animations
all_animations : gif/no_padding_no_strides.gif gif/dilation.gif

.SECONDARY : 

gif/no_padding_no_strides.gif : png/no_padding_no_strides_00.png png/no_padding_no_strides_01.png png/no_padding_no_strides_02.png png/no_padding_no_strides_03.png png/no_padding_no_strides_04.png png/no_padding_no_strides_05.png
	convert -delay 100 -loop 0 -layers Optimize +map -dispose previous $^ $@
	gifsicle --batch -O3 $@

gif/dilation.gif : png/dilation_00.png png/dilation_01.png png/dilation_02.png png/dilation_03.png
	convert -delay 100 -loop 0 -layers Optimize +map -dispose previous $^ $@
	gifsicle --batch -O3 $@

png/%.png : pdf/%.pdf
	convert -density 600 $< -flatten -resize 25% $@

pdf/no_padding_no_strides_00.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 0 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/no_padding_no_strides_01.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 1 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/no_padding_no_strides_02.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 2 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/no_padding_no_strides_03.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 3 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/no_padding_no_strides_04.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 4 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/no_padding_no_strides_05.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic no_padding_no_strides 5 --input-size-x=8 --input-size-y=3 --output-size-x=6 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 

pdf/dilation_00.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic dilation 0 --input-size-x=8 --input-size-y=3 --output-size-x=4 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 --dilation-x=2 

pdf/dilation_01.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic dilation 1 --input-size-x=8 --input-size-y=3 --output-size-x=4 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 --dilation-x=2 

pdf/dilation_02.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic dilation 2 --input-size-x=8 --input-size-y=3 --output-size-x=4 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 --dilation-x=2 

pdf/dilation_03.pdf : bin/produce_figure templates/arithmetic_figure.txt templates/unit.txt
	./bin/produce_figure arithmetic dilation 3 --input-size-x=8 --input-size-y=3 --output-size-x=4 --output-size-y=1 --padding=0 --kernel-size-x=3 --kernel-size-y=3 --stride=1 --dilation-x=2 
