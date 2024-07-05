%% PROJECT STAGE 2

% The bug in stage 1 was fixed by superimposing another input field over
% the current input field. This way, one input field was only for numerics
% whereas the other input field handled text.

% Functionality for atomic symbol and atomic name was also added.

%%

classdef project_stage2 < matlab.apps.AppBase
    
    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        EditField_2              matlab.ui.control.EditField
        UITable                  matlab.ui.control.Table
        EditField                matlab.ui.control.NumericEditField
        GoButton                 matlab.ui.control.Button
        PleaseEnterDropDown      matlab.ui.control.DropDown
        PleaseEnterLabel         matlab.ui.control.Label
        ThisprogramletsyouLabel  matlab.ui.control.Label
    end
    
    
    properties (Access = private)
        
        % Initializing atomicNumber to store the atomic numbers.
        atomicNumber = [1:118];
        
        % Initializing atomicSymbols to store the atomic symbols.
        atomicSymbols = [
            "H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", ...
            "S", "Cl", "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", ...
            "Zn", "Ga", "Ge", "As", "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", ...
            "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", ...
            "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb", "Lu", ...
            "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", "At", ...
            "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", ...
            "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Cn", "Nh", ...
            "Fl", "Mc", "Lv", "Ts", "Og"
            ];
        
        % Initializing atomicElements to store the names of all atomic elements.
        atomicElements = [
            "Hydrogen", "Helium", "Lithium", "Beryllium", "Boron", "Carbon", ...
            "Nitrogen", "Oxygen", "Fluorine", "Neon", "Sodium", "Magnesium", ...
            "Aluminum", "Silicon", "Phosphorus", "Sulfur", "Chlorine", "Argon", ...
            "Potassium", "Calcium", "Scandium", "Titanium", "Vanadium", "Chromium", ...
            "Manganese", "Iron", "Cobalt", "Nickel", "Copper", "Zinc", "Gallium", ...
            "Germanium", "Arsenic", "Selenium", "Bromine", "Krypton", "Rubidium", ...
            "Strontium", "Yttrium", "Zirconium", "Niobium", "Molybdenum", "Technetium", ...
            "Ruthenium", "Rhodium", "Palladium", "Silver", "Cadmium", "Indium", "Tin", ...
            "Antimony", "Tellurium", "Iodine", "Xenon", "Cesium", "Barium", "Lanthanum", ...
            "Cerium", "Praseodymium", "Neodymium", "Promethium", "Samarium", "Europium", ...
            "Gadolinium", "Terbium", "Dysprosium", "Holmium", "Erbium", "Thulium", ...
            "Ytterbium", "Lutetium", "Hafnium", "Tantalum", "Tungsten", "Rhenium", ...
            "Osmium", "Iridium", "Platinum", "Gold", "Mercury", "Thallium", "Lead", ...
            "Bismuth", "Polonium", "Astatine", "Radon", "Francium", "Radium", "Actinium", ...
            "Thorium", "Protactinium", "Uranium", "Neptunium", "Plutonium", "Americium", ...
            "Curium", "Berkelium", "Californium", "Einsteinium", "Fermium", ...
            "Mendelevium", "Nobelium", "Lawrencium", "Rutherfordium", "Dubnium", ...
            "Seaborgium", "Bohrium", "Hassium", "Meitnerium", "Darmstadtium", ...
            "Roentgenium", "Copernicium", "Nihonium", "Flerovium", "Moscovium", ...
            "Livermorium", "Tennessine", "Oganesson"
            ];
    end
    
    methods (Access = private)
        
        % Function to provide a lookup which returns the corresponding
        % atomic symbol and atomic name when atomic number is provided
        function [num] = atomNum(app,value)
            num = [app.atomicNumber(value), app.atomicSymbols(value), app.atomicElements(value)];
        end
        
        % Function to provide a lookup which returns the corresponding
        % atomic number and atomic name when atomic symbol is provided
        function [symbol] = atomSymbol(app,value)
            symbol=  [];
            for i = 1:118
                if contains(app.atomicSymbols(i), value,'IgnoreCase',true)
                    symbol = [symbol; app.atomicNumber(i), app.atomicSymbols(i), app.atomicElements(i)];
                end
            end
        end
        
        % Function to provide a lookup which returns the corresponding
        % atomic number and atomic symbol when atomic name is provided
        function [name] = atomName(app,value)
            name=  [];
            for i = 1:118
                if contains(app.atomicElements(i), value,'IgnoreCase',true)
                    name = [name; app.atomicNumber(i), app.atomicSymbols(i), app.atomicElements(i)];
                end
            end
        end
    end
    
    % Callbacks that handle component events
    methods (Access = private)
        
        % Clicked callback: PleaseEnterDropDown
        function PleaseEnterDropDownClicked(app, event)
            
            % If-else statements to change the text box between numeric and
            % letters according to the option selected by the user.
            if strcmp (app.PleaseEnterDropDown.Value, "Atomic Number")
                app.EditField.Visible = "on";
                app.EditField.Editable = "on";
                app.EditField_2.Visible = "off";
                app.EditField_2.Editable = "off";
            elseif strcmp (app.PleaseEnterDropDown.Value, "Atomic Symbol")
                app.EditField.Visible = "off";
                app.EditField.Editable = "off";
                app.EditField_2.Visible = "on";
                app.EditField_2.Editable = "on";
            elseif strcmp (app.PleaseEnterDropDown.Value, "Atomic Name")
                app.EditField.Visible = "off";
                app.EditField.Editable = "off";
                app.EditField_2.Visible = "on";
                app.EditField_2.Editable = "on";
            end
        end
        
        % Button pushed function: GoButton
        function GoButtonPushed(app, ~)
            value = app.EditField.Value;
            value1 = app.EditField_2.Value;
            
            % If-else statements for calling the lookup based on the option
            % selected by the user and displaying the results in the table.
            if strcmp (app.PleaseEnterDropDown.Value, "Atomic Number")
                app.UITable.Data = atomNum(app,value);
            elseif strcmp (app.PleaseEnterDropDown.Value, "Atomic Symbol")
                app.UITable.Data = atomSymbol(app,value1);
            elseif strcmp (app.PleaseEnterDropDown.Value, "Atomic Name")
                app.UITable.Data = atomName(app,value1);
            end
        end
    end
    
    % Component initialization
    methods (Access = private)
        
        % Create UIFigure and components
        function createComponents(app)
            
            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
            
            % Create ThisprogramletsyouLabel
            app.ThisprogramletsyouLabel = uilabel(app.UIFigure);
            app.ThisprogramletsyouLabel.BackgroundColor = [0.651 0.651 0.651];
            app.ThisprogramletsyouLabel.HorizontalAlignment = 'center';
            app.ThisprogramletsyouLabel.FontSize = 16.5;
            app.ThisprogramletsyouLabel.FontWeight = 'bold';
            app.ThisprogramletsyouLabel.Position = [1 374 640 106];
            app.ThisprogramletsyouLabel.Text = 'This program lets you go through the atomic elements of the periodic table. ';
            
            % Create PleaseEnterLabel
            app.PleaseEnterLabel = uilabel(app.UIFigure);
            app.PleaseEnterLabel.HorizontalAlignment = 'right';
            app.PleaseEnterLabel.Position = [140 322 77 22];
            app.PleaseEnterLabel.Text = 'Please Enter:';
            
            % Create PleaseEnterDropDown
            app.PleaseEnterDropDown = uidropdown(app.UIFigure);
            app.PleaseEnterDropDown.Items = {'Atomic Number', 'Atomic Symbol', 'Atomic Name'};
            app.PleaseEnterDropDown.ClickedFcn = createCallbackFcn(app, @PleaseEnterDropDownClicked, true);
            app.PleaseEnterDropDown.Position = [232 319 229 28];
            app.PleaseEnterDropDown.Value = 'Atomic Number';
            
            % Create GoButton
            app.GoButton = uibutton(app.UIFigure, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.Position = [431 265 31 23];
            app.GoButton.Text = 'Go';
            
            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'numeric');
            app.EditField.Position = [167 262 249 26];
            
            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Atomic Number'; 'Atomic Symbol'; 'Atomic Name'};
            app.UITable.RowName = {};
            app.UITable.Position = [164 57 314 150];
            
            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'text');
            app.EditField_2.InputType = 'letters';
            app.EditField_2.Editable = 'off';
            app.EditField_2.Visible = 'off';
            app.EditField_2.Position = [167 262 249 26];
            
            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end
    
    % App creation and deletion
    methods (Access = public)
        
        % Construct app
        function app = project_stage2
            
            % Create UIFigure and components
            createComponents(app)
            
            % Register the app with App Designer
            registerApp(app, app.UIFigure)
            
            if nargout == 0
                clear app
            end
        end
        
        % Code that executes before app deletion
        function delete(app)
            
            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end