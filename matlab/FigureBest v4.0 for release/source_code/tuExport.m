function picPath = tuExport(varargin)

% �������ܣ�figure ��������>����ͼƬ
% -------------------------------------------------
% ����˵����figure�����ͼƬ������ʽ���Ƿ��Ƶ����а壬�ֱ���
% -------------------------------------------------
% ����ֵ�������ͼƬ·��
% -------------------------------------------------
%
% -------------------------------------------------
% ��ʽformat �� '-dtiff' '-dpng' '-djpeg' '-depsc' '-dpdf' ��
% �Ƿ��Ƶ����а�pasteMode��'on' 'off' ��
% �ֱ��ʽ��飺'600' ��
%

% ��������
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

% ���������ʽ
figH.PaperType = 'a4'; % ���ñ�׼ҳ���С
figH.PaperPositionMode = 'auto';% ��ӡ�򱣴��ͼ����С����ʾ��ͼ����С��ƥ��
figH.InvertHardcopy = 'off'; % ������ӡʱʹ��������ʾ��ɫ��ͬ����ɫ

% ��ȡ���ͼƬ���ļ���

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
        error('����ʱ�������󣡡�������ʾ���뽫��ǰĿ¼�л���..FigureBest\source_code�ļ���')
    end
    fclose(fid);
else
    folder = handlesfortuexport.folder.String;
end


% ���ͼƬ������·����������ʽ
picName = [picName datestr(now,'yyyymmddTHHMMSS')] ; % ͼƬ������ϵͳʱ�䱣֤Ψһ��
picName = [folder '\' picName];


disp('���ڵ�������ȴ�...')
% ������ͼƬ��ʽ����
if strcmp(format,'-depsc')
    figH.Renderer = 'painters'; % 'painters'Ϊʸ����Ⱦ��'opengl'Ϊλͼ��Ⱦ��
    try
        print(figH,format,picName);
    catch
        error('!!�ļ��в�����' )
    end
    picPath = [picName '.eps']; % �������ɵ�ͼƬ·��
elseif strcmp(format,'-dpdf')
    figH.Renderer = 'painters'; % 'painters'Ϊʸ����Ⱦ��'opengl'Ϊλͼ��Ⱦ��
    try
        print(figH,format,picName);
    catch
        error('!!�ļ��в�����')
    end
    picPath = [picName '.pdf']; % �������ɵ�ͼƬ·��
else
    figH.Renderer = 'opengl';
    if nVar == 5
        try
            print(figH,format,picName,['-r'  varargin{5}]);
        catch
            error('!!�ļ��в�����')
        end
    else
        try
            print(figH,format,picName,'-r600');
        catch
            error('!!�ļ��в�����')
        end
    end%�ж��Ƿ���Ҫ���÷ֱ���
    picPath = [picName '.' format(3:end)]; % �������ɵ�ͼƬ·��
end

% ��¼���һ�δ洢��ͼƬ��
fid = fopen( [path '\settings\name_append.txt'],'w+','n','utf-8');
fprintf(fid,'%s\n',picPath);
fclose(fid);

% �Ƿ��Ƶ����а�
if strcmp(pasteMode,'on')
    print('-clipboard','-dmeta');
end

disp('������ɣ�')

