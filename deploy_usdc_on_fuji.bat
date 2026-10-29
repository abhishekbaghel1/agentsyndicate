@echo off
echo ===================================================
echo Deploying MockUSDC to Avalanche Fuji Testnet...
echo ===================================================
cd contracts
call npx hardhat run scripts/deploy_usdc.js --network fuji
echo ===================================================
echo Deployment completed! You can close this window now.
echo ===================================================
pause
