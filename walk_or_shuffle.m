function[WS] = walk_or_shuffle(dataset,fs)
if ~isvector(dataset)
    error('input must be vector')
end
if meanfreq(dataset,fs) < 1
    WS = 0;
end
if meanfreq(dataset,fs) > 1
    WS = 1;
end
