function varargout = IdealHighpassFilterfig(varargin)
% IDEALHIGHPASSFILTERFIG MATLAB code for IdealHighpassFilterfig.fig
%      IDEALHIGHPASSFILTERFIG, by itself, creates a new IDEALHIGHPASSFILTERFIG or raises the existing
%      singleton*.
%
%      H = IDEALHIGHPASSFILTERFIG returns the handle to a new IDEALHIGHPASSFILTERFIG or the handle to
%      the existing singleton*.
%
%      IDEALHIGHPASSFILTERFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDEALHIGHPASSFILTERFIG.M with the given input arguments.
%
%      IDEALHIGHPASSFILTERFIG('Property','Value',...) creates a new IDEALHIGHPASSFILTERFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IdealHighpassFilterfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IdealHighpassFilterfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IdealHighpassFilterfig

% Last Modified by GUIDE v2.5 19-May-2022 02:38:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IdealHighpassFilterfig_OpeningFcn, ...
                   'gui_OutputFcn',  @IdealHighpassFilterfig_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before IdealHighpassFilterfig is made visible.
function IdealHighpassFilterfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IdealHighpassFilterfig (see VARARGIN)

% Choose default command line output for IdealHighpassFilterfig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IdealHighpassFilterfig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IdealHighpassFilterfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global original
original=strcat(pathname,filename);
global image
global rows
global columns
image=imread(original);
[rows,columns,matrixno]=size(image);
global input_image
%check if it is RGB image
if size(image,3)==3
    input_image=rgb2gray(image);
end

axes(handles.axes1);
imshow(input_image);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rows
global columns
global input_image
global FT_img
FT_img=fft2(double(input_image));
global D0
D0=str2num(get(handles.edit2,'String'));
%Designing filter
u=0:(rows-1);
idx=find(u>rows/2);
u(idx)=u(idx)-rows;
v=0:(columns-1);
idy=find(v>columns/2);
v(idy)=v(idy)-columns;
% matlab function meshgrid (v,u) returns 
% 2D GRID which contains the coordinate of vectors 
% v and u . matrix v with each row is a copy
%of v and matrix u with each column is a copy of u
[V,U]=meshgrid(v,u);

%calculating Euclidean Distance 
D=sqrt(U.^2+V.^2);
%comparing with the cutoff frequency and
%determining the filtering mask
H=double(D0<=D);
%convulution between the Fourier Transformed
%image and the mask
G=H.*FT_img;
%getting the resultant image by Inverse fourier Transform 
%of the convoluted image using matlab library functio
%iff2(2d INVERSE fast fourier transform)

global output_image
output_image=real(ifft2(double(G)));
axes(handles.axes2);
imshow(output_image,[ ]);


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Gaussian_low_pass_filter;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
ideallowpassfilter;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global output_image;

[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( output_image, fullFileName);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
I=imread('back.jpg');
hi = imagesc(I)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
axes('position',[0,0,0,0])
plot(rand(10))
