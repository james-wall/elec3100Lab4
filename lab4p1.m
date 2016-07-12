% encode letters
letter=[1 2 3]; % letter 1,2,and 3.
p= [.75 .1875 .0625];% missing code (p = probability distribution}
[dict,avglen]=huffmandict(letter, p); % dictionary and avg. bit/message
% show dictionary and codeword
for n=1:3
 [letter,codeword]=dict{n,:}; % create codeword for each message
end;

% encode data stream
datastream=[ 1 1 1 2 2 3 1 1 1 1]; % datastream
encodata= huffmanenco(datastream, dict); % missing code (encode datastream)
% show results
fprintf('Average code length=%f(bit/letter)\n',avglen);
encodata;