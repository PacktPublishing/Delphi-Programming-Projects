object PacktBooks_Service: TPacktBooks_Service
  OldCreateOrder = False
  DisplayName = 'PacktBooks_Service'
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 88
    Top = 56
  end
end
