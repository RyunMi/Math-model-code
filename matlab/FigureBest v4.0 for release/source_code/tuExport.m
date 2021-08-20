function picPath = tuExport(varargin)

% 函数功能：figure ————>导出图片
% -------------------------------------------------
% 参数说明：figure句柄，图片名，格式，是否复制到剪切板，分辨率
% -------------------------------------------------
% 返回值：保存的图片路径
% -------------------------------------------------
%
% -------------------------------------------------
% 格式format ： '-dtiff' '-dpng' '-djpeg' '-depsc' '-dpdf' ；
% 是否复制到剪切板pasteMode：'on' 'off' ；
% 分辨率建议：'600' ；
%

% 参数重载
nVar = length(varargin);
switch nVar
    case 0
        figH = gcf;
        picName = 'tutuPic_';
        format = '-dpng';
        pasteMode = 'off';
    case 1
        figH = varargin{1};
        picName = 'tutuPic_' ;
        format = '-dpng';
        pasteMode = 'off';
    case 2
        figH = varargin{1};
        picName = varargin{2};
        format = '-dpng';
        pasteMode = 'off';
    case 3
        figH = varargin{1};
        picName = varargin{2};
        format = varargin{3};
        pasteMode = 'off';
    case {4,5}
        figH = varargin{1};
        picName = varargin{2};
        format = varargin{3};
        pasteMode = varargin{4};
end

% 设置输出样式
figH.PaperType = 'a4'; % 设置标准页面大小
figH.PaperPositionMode = 'auto';% 打印或保存的图窗大小与显示的图窗大小相匹配
figH.InvertHardcopy = 'off'; % 保存或打印时使用与所显示颜色相同的颜色

% 读取输出图片的文件夹

global handlesfortuexport

str = which('functionforlocation');
index_dir=strfind(str,'\');
path=str(1:index_dir(length(index_dir)-1)-1);
if isempty(handlesfortuexport)
    fid = fopen( [path '\settings\output_path.txt'],'r','n','utf-8');
    try
        folder = fscanf(fid,'%s');
    catch
        clc
        error('导出时发生错误！【错误提示】请将当前目录切换到..FigureBest\source_code文件夹')
    end
    fclose(fid);
else
    folder = handlesfortuexport.folder.String;
end


% 组合图片名，含路径，不带格式
picName = [picName datestr(now,'yyyymmddTHHMMSS')] ; % 图片名，由系统时间保证唯一性
picName = [folder '\' picName];


disp('正在导出，请等待...')
% 导出的图片格式设置
if strcmp(format,'-depsc')
    figH.Renderer = 'painters'; % 'painters'为矢量渲染，'opengl'为位图渲染器
    try
        print(figH,format,picName);
    catch
        error('!!文件夹不存在' )
    end
    picPath = [picName '.eps']; % 返回生成的图片路径
elseif strcmp(format,'-dpdf')
    figH.Renderer = 'painters'; % 'painters'为矢量渲染，'opengl'为位图渲染器
    try
        print(figH,format,picName);
    catch
        error('!!文件夹不存在')
    end
    picPath = [picName '.pdf']; % 返回生成的图片路径
else
    figH.Renderer = 'opengl';
    if nVar == 5
        try
            print(figH,format,picName,['-r'  varargin{5}]);
        catch
            error('!!文件夹不存在')
        end
    else
        try
            print(figH,format,picName,'-r600');
        catch
            error('!!文件夹不存在')
        end
    end%判断是否需要设置分辨率
    picPath = [picName '.' format(3:end)]; % 返回生成的图片路径
end

% 记录最后一次存储的图片名
fid = fopen( [path '\settings\name_append.txt'],'w+','n','utf-8');
fprintf(fid,'%s\n',picPath);
fclose(fid);

% 是否复制到剪切板
if strcmp(pasteMode,'on')
    print('-clipboard','-dmeta');
end

disp('导出完成！')

