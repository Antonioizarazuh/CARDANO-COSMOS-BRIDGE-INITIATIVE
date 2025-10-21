use cosmwasm_std::{DepsMut, Env, MessageInfo, Response, StdResult, Uint128};

// This function mints wrapped ADA to the sender. In production, it would validate a Cardano proof.
pub fn execute_mint_wada(
    deps: DepsMut,
    _env: Env,
    info: MessageInfo,
    amount: Uint128,
) -> StdResult<Response> {
    Ok(Response::new()
        .add_attribute("action", "mint_wada")
        .add_attribute("to", info.sender.to_string())
        .add_attribute("amount", amount.to_string()))
}
