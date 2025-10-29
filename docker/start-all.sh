#/!bin/sh

echo Starting in-mem repository....
./SpaceDemo.Repository 80 --non-interactive &
sleep 2

echo Starting validator....
./SpaceDemo.Validator 80 --non-interactive &
sleep 2

echo Starting model loader....
./SpaceDemo.Loader chunks/ localhost 80
