% encode letters
letter=[1 2 3]; % letter 1,2,and 3.
p= [.75 .1875 .0625];% missing code (p = probability distribution}
[dict,avglen]=huffmandict(letter, p); % dictionary and avg. bit/message
% show dictionary and codeword
for n=1:3
 [letter,codeword]=dict{n,:}; % create codeword for each message
end;

% decode a bitstream
bitstream=[0 0 0 1 1 1 1 0 1 1 1 1 0 1 0 0 1 0 1 1 0];
decodedstream = huffmandeco(bitstream,dict);% missing code (decode the bitstream)