math.randomseed(42)

g_dW = 84
g_dH = 54
local list = {}

function tInitRawMap(map)
    for i = 0, g_dH, 1 do
        map[i] = {}
    end
    return map
end

function tFillMapRandom(map, threshold)
    for i = 0, g_dH, 1 do
        for j = 0, g_dW, 1 do
            local value = 0;
            if math.random() > threshold
            then
                value = 1;
            end
            map[i][j] = value
        end
    end
    return map
end

function tOutputMap(map)
    for i = 0, g_dH, 1 do
        if (math.fmod(i,2) == 1) then
            io.write(' ')
        end  
        for j = 0, g_dW, 1 do
            local label = map[i][j]
            if label == 0 then
                label = '. '
            elseif 0 < label and label <= 1 then
                label = '1 '
            elseif 1 < label and label <= 2 then
                label = '2 '
            elseif 2 < label and label <= 3 then
                label = '3 '
            elseif 3 < label and label <= 4 then
                label = '4 '
            elseif 4 < label and label <= 5 then
                label = '5 '
            elseif 5 < label and label <= 6 then
                label = '6 '
            else
                label = '# '
            end
            io.write(label)
        end
        io.write("\n")
        io.flush()
    end
end

function tIsValidCoords(iI, iJ)
    return not (iI < 0 or g_dH < iI or iJ < 0 or g_dW < iJ)
end

function tKernelRun(map, kernelSize, iI, iJ)
    local size = kernelSize
    --[[
        Case 1: even line
     -1 0 
    -1 0 1
     -1 0 
        Case 2: odd line
      0 1 
    -1 0 1
      0 1 
    ]]--
    kernelvalue = 0
    if not tIsValidCoords(iI, iJ) then
        return nil
    end
    if (math.fmod(iI,2) == 0) then
        for i = -size, size, 1 do
            for j = -size, size, 1 do
                tilevalue = 0
                if (tIsValidCoords(iI + i, iJ + j))  then
                    tilevalue = map[iI + i][iJ + j]
                end
                if not (j == size and i ~= 0) then
                    kernelvalue = kernelvalue + tilevalue
                end
            end
        end
    else
        for i = -size, size, 1 do
            for j = -size, size, 1 do
                tilevalue = 0
                if (tIsValidCoords(iI + i, iJ + j))  then
                    tilevalue = map[iI + i][iJ + j]
                end
                if not (j == -size and i ~= 0) then
                    kernelvalue = kernelvalue + tilevalue 
                end
            end
        end
    end
    return kernelvalue
end

function tConvolution2DMap(map, kernelSize)
    list = {}
    tmpmap = tInitRawMap(list)
    for i = 0, g_dH, 1 do
        for j = 0, g_dW, 1 do
            tmpmap[i][j] = tKernelRun(map, kernelSize, i, j)
        end
    end
    return tmpmap
end


map = tInitRawMap(list)
map = tFillMapRandom(map, 0.95)
-- tOutputMap(map)
print()
map = tConvolution2DMap(map, 5)
-- tOutputMap(map)
